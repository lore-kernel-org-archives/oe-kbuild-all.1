Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A0120F2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 07:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689148008; x=1720684008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y2+GjsWU9xbRrSIiWDaKg/Q1k+NXIOrekZxfF3AZCGQ=;
  b=XA98o6DkSHVkj22VYBTV8HFUo/gL4C2kNHifw4bysE8KHmwRY5wahV9T
   VphoGWC4bP3hrIvICjgP0+101F0nqUEyjxu61J5i2NTTxC5lfsrxfi2gM
   BrIHuXGqzPSRemKO6/rYV5XBuGURnja68HwqLaNNW+22Fx+JoIDdxpCYD
   SLxJO1ArBjBdfHv3cuZ9dIqcIfiHqMMd3GAFAaTO6G6+cb9rQNdXUklMT
   ivNK4Bc8L9Tp5G3FmCSD33kfYvGNS+f/6iIJUGw/wOENE1WFDXHDMbnUz
   FsnroiPIEyHmHHzmkNvgA8YHQIcpOlcKuY+FV0S2uq+AmMCMe/oj3Vt5C
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="354734034"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="354734034"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 00:46:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="845560292"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="845560292"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 12 Jul 2023 00:46:46 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJUYf-0005Vd-2o;
	Wed, 12 Jul 2023 07:46:45 +0000
Date: Wed, 12 Jul 2023 15:46:27 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.4 716/719]
 security/apparmor/policy_unpack.c:1173: warning: expecting prototype for
 verify_dfa_accept_xindex(). Prototype was for verify_dfa_accept_index()
 instead
Message-ID: <202307121517.hnndGmYE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.4
head:   3e07459e3b3562fda8192f91db788c99827f23a0
commit: 10cbca81e0a325759b5b128574e31609495d518a [716/719] apparmor: fix profile verification and enable it
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230712/202307121517.hnndGmYE-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307121517.hnndGmYE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307121517.hnndGmYE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/apparmor/policy_unpack.c:456: warning: Function parameter or member 'strs' not described in 'unpack_trans_table'
   security/apparmor/policy_unpack.c:456: warning: Excess function parameter 'table' description in 'unpack_trans_table'
   security/apparmor/policy_unpack.c:1173: warning: Function parameter or member 'table_size' not described in 'verify_dfa_accept_index'
>> security/apparmor/policy_unpack.c:1173: warning: expecting prototype for verify_dfa_accept_xindex(). Prototype was for verify_dfa_accept_index() instead


vim +1173 security/apparmor/policy_unpack.c

736ec752d95e91 John Johansen 2010-07-29  1166  
10cbca81e0a325 John Johansen 2023-04-17  1167  /**
10cbca81e0a325 John Johansen 2023-04-17  1168   * verify_dfa_accept_xindex - verify accept indexes are in range of perms table
10cbca81e0a325 John Johansen 2023-04-17  1169   * @dfa: the dfa to check accept indexes are in range
10cbca81e0a325 John Johansen 2023-04-17  1170   * table_size: the permission table size the indexes should be within
10cbca81e0a325 John Johansen 2023-04-17  1171   */
10cbca81e0a325 John Johansen 2023-04-17  1172  static bool verify_dfa_accept_index(struct aa_dfa *dfa, int table_size)
736ec752d95e91 John Johansen 2010-07-29 @1173  {
736ec752d95e91 John Johansen 2010-07-29  1174  	int i;
736ec752d95e91 John Johansen 2010-07-29  1175  	for (i = 0; i < dfa->tables[YYTD_ID_ACCEPT]->td_lolen; i++) {
10cbca81e0a325 John Johansen 2023-04-17  1176  		if (ACCEPT_TABLE(dfa)[i] >= table_size)
e37986097ba63c Zou Wei       2020-04-28  1177  			return false;
736ec752d95e91 John Johansen 2010-07-29  1178  	}
e37986097ba63c Zou Wei       2020-04-28  1179  	return true;
736ec752d95e91 John Johansen 2010-07-29  1180  }
736ec752d95e91 John Johansen 2010-07-29  1181  

:::::: The code at line 1173 was first introduced by commit
:::::: 736ec752d95e91e77cc0e8c97c057ab076ac2f51 AppArmor: policy routines for loading and unpacking policy

:::::: TO: John Johansen <john.johansen@canonical.com>
:::::: CC: James Morris <jmorris@namei.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
