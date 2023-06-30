Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB8F14299
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jun 2023 14:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688136692; x=1719672692;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KHC37FB/l2e8PN0EPS19YVx+v/nh9xXLsvQfrHICQ20=;
  b=M/lr+ha2OYuSoHlLVSyAoLBo9+Gfvwlt3hlO1ddsg5ag6q3Quw5f6auZ
   4Uk8eYohpxGU+CJCU9LPPz4th499PxCHnW9b3erpxcqpE5ZjU3RU0IeCi
   Nla7hbQuChI3hnAaAKqNnutd4baV41E6SsIftHFHLNTsvClTtDy6dwktx
   VY1o6YHpEBSYDRZ+oipqrWpcfd8L2PbynHeyK2UIiKBMh3rIbpN311NVq
   +ZeqisG3fNP9/XAVyk2JVUKwqm5hCJWUTeZMXqfrQh0dDhuMG9X0hRo9e
   VPU/0I/69/at6afboAjdMaJIBnrT0wB+0GDJUZR4CmdqFOBVSyPhofHLV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="347190795"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="347190795"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 07:51:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="830962332"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="830962332"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 30 Jun 2023 07:51:29 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFFT6-000F2r-2c;
	Fri, 30 Jun 2023 14:51:28 +0000
Date: Fri, 30 Jun 2023 22:51:01 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Simo Sorce <simo@redhat.com>
Subject: net/sunrpc/auth_gss/gss_krb5_mech.c:181
 gss_krb5_prepare_enctype_priority_list() warn: unsigned 'i' is never less
 than zero.
Message-ID: <202306302221.9wcsHTOG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e55e5df193d247a38a5e1ac65a5316a0adcc22fa
commit: dfe9a123451a6e73306c988eab3dab12df001677 SUNRPC: Enable rpcsec_gss_krb5.ko to be built without CRYPTO_DES
date:   4 months ago
config: x86_64-randconfig-m001-20230629 (https://download.01.org/0day-ci/archive/20230630/202306302221.9wcsHTOG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306302221.9wcsHTOG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306302221.9wcsHTOG-lkp@intel.com/

New smatch warnings:
net/sunrpc/auth_gss/gss_krb5_mech.c:181 gss_krb5_prepare_enctype_priority_list() warn: unsigned 'i' is never less than zero.
net/sunrpc/auth_gss/gss_krb5_mech.c:181 gss_krb5_prepare_enctype_priority_list() warn: unsigned 'i' is never less than zero.

Old smatch warnings:
net/sunrpc/auth_gss/gss_krb5_mech.c:200 supported_gss_krb5_enctype() warn: we never enter this loop
net/sunrpc/auth_gss/gss_krb5_mech.c:210 get_gss_krb5_enctype() warn: we never enter this loop

vim +/i +181 net/sunrpc/auth_gss/gss_krb5_mech.c

17781b2ce41a89 Chuck Lever 2023-01-15  159  
17781b2ce41a89 Chuck Lever 2023-01-15  160  static void gss_krb5_prepare_enctype_priority_list(void)
17781b2ce41a89 Chuck Lever 2023-01-15  161  {
17781b2ce41a89 Chuck Lever 2023-01-15  162  	static const u32 gss_krb5_enctypes[] = {
dfe9a123451a6e Chuck Lever 2023-01-15  163  #if defined(CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_AES_SHA1)
17781b2ce41a89 Chuck Lever 2023-01-15  164  		ENCTYPE_AES256_CTS_HMAC_SHA1_96,
17781b2ce41a89 Chuck Lever 2023-01-15  165  		ENCTYPE_AES128_CTS_HMAC_SHA1_96,
dfe9a123451a6e Chuck Lever 2023-01-15  166  #endif
dfe9a123451a6e Chuck Lever 2023-01-15  167  #if defined(CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_DES)
17781b2ce41a89 Chuck Lever 2023-01-15  168  		ENCTYPE_DES3_CBC_SHA1,
17781b2ce41a89 Chuck Lever 2023-01-15  169  		ENCTYPE_DES_CBC_MD5,
17781b2ce41a89 Chuck Lever 2023-01-15  170  		ENCTYPE_DES_CBC_CRC,
17781b2ce41a89 Chuck Lever 2023-01-15  171  		ENCTYPE_DES_CBC_MD4,
17781b2ce41a89 Chuck Lever 2023-01-15  172  #endif
17781b2ce41a89 Chuck Lever 2023-01-15  173  	};
17781b2ce41a89 Chuck Lever 2023-01-15  174  	size_t total, i;
17781b2ce41a89 Chuck Lever 2023-01-15  175  	char buf[16];
17781b2ce41a89 Chuck Lever 2023-01-15  176  	char *sep;
17781b2ce41a89 Chuck Lever 2023-01-15  177  	int n;
17781b2ce41a89 Chuck Lever 2023-01-15  178  
17781b2ce41a89 Chuck Lever 2023-01-15  179  	sep = "";
17781b2ce41a89 Chuck Lever 2023-01-15  180  	gss_krb5_enctype_priority_list[0] = '\0';
17781b2ce41a89 Chuck Lever 2023-01-15 @181  	for (total = 0, i = 0; i < ARRAY_SIZE(gss_krb5_enctypes); i++) {
17781b2ce41a89 Chuck Lever 2023-01-15  182  		n = sprintf(buf, "%s%u", sep, gss_krb5_enctypes[i]);
17781b2ce41a89 Chuck Lever 2023-01-15  183  		if (n < 0)
17781b2ce41a89 Chuck Lever 2023-01-15  184  			break;
17781b2ce41a89 Chuck Lever 2023-01-15  185  		if (total + n >= sizeof(gss_krb5_enctype_priority_list))
17781b2ce41a89 Chuck Lever 2023-01-15  186  			break;
17781b2ce41a89 Chuck Lever 2023-01-15  187  		strcat(gss_krb5_enctype_priority_list, buf);
17781b2ce41a89 Chuck Lever 2023-01-15  188  		sep = ",";
17781b2ce41a89 Chuck Lever 2023-01-15  189  		total += n;
17781b2ce41a89 Chuck Lever 2023-01-15  190  	}
17781b2ce41a89 Chuck Lever 2023-01-15  191  }
17781b2ce41a89 Chuck Lever 2023-01-15  192  

:::::: The code at line 181 was first introduced by commit
:::::: 17781b2ce41a8915163d7cdada021f809ccd49f0 SUNRPC: Replace KRB5_SUPPORTED_ENCTYPES macro

:::::: TO: Chuck Lever <chuck.lever@oracle.com>
:::::: CC: Chuck Lever <chuck.lever@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
