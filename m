Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551E58F4B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jan 2023 20:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674592101; x=1706128101;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=puAcxNLWWaHXKYJrint6wwaEwK0Ntvj1kPLRbkcrwKc=;
  b=PQkxYf79nJT6D+LA4CSyAOBmUcIPEpg7KU8RhyYkJgd3bq/qcTxvcAqI
   MpaiIbAhrOuJsITjMtBMoKS09WdpwWXkPHrSnctv/5FT0w4aqUjMmE8jg
   SlZAlAUPiR/2pIBLZIZGX9NyHU49cFb5AMGSDnnPGmiTTFkZZdSc1wBNY
   LlA/QAM9/g8CeNidFOGprIR3U137lsWGhNkcWHOkKCjRcFlCAmQ5VMO8v
   srFFrxuT3oN+yN+bBPKzRMHOIgWmF4vHzSeiV4fUpw9KoJDNByBsp+psd
   63e/n8jc0/BxcKMk2z8dw51FzIc3gg31dP4rbNGWeTTKnvSWoq5cLHag0
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="353677034"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; 
   d="scan'208";a="353677034"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 12:28:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="750948721"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; 
   d="scan'208";a="750948721"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Jan 2023 12:28:19 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKPty-0006ky-1x;
	Tue, 24 Jan 2023 20:28:18 +0000
Date: Wed, 25 Jan 2023 04:27:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next RFC 13/20] p4tc: add metadata create, update,
 delete, get, flush and dump
Message-ID: <202301250432.89G89lJM-lkp@intel.com>
References: <20230124170510.316970-13-jhs@mojatatu.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230124170510.316970-13-jhs@mojatatu.com>

Hi Jamal,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Jamal-Hadi-Salim/net-sched-act_api-increase-action-kind-string-length/20230125-010934
patch link:    https://lore.kernel.org/r/20230124170510.316970-13-jhs%40mojatatu.com
patch subject: [PATCH net-next RFC 13/20] p4tc: add metadata create, update, delete, get, flush and dump
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230125/202301250432.89G89lJM-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d08516cc5ac3083da3dbca82ec09cf6127d47e61
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jamal-Hadi-Salim/net-sched-act_api-increase-action-kind-string-length/20230125-010934
        git checkout d08516cc5ac3083da3dbca82ec09cf6127d47e61
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash net/kparser/ net/sched/p4tc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/sched/p4tc/p4tc_meta.c:326:23: warning: no previous prototype for 'tcf_meta_create' [-Wmissing-prototypes]
     326 | struct p4tc_metadata *tcf_meta_create(struct nlmsghdr *n, struct nlattr *nla,
         |                       ^~~~~~~~~~~~~~~
   net/sched/p4tc/p4tc_meta.c: In function 'tcf_meta_init':
>> net/sched/p4tc/p4tc_meta.c:787:7: warning: "define" is not defined, evaluates to 0 [-Wundef]
     787 | #elif define(__BIG_ENDIAN_BITFIELD)
         |       ^~~~~~
   net/sched/p4tc/p4tc_meta.c:787:13: error: missing binary operator before token "("
     787 | #elif define(__BIG_ENDIAN_BITFIELD)
         |             ^
   net/sched/p4tc/p4tc_meta.c:809:2: error: #error "Please fix <asm/byteorder.h>"
     809 | #error "Please fix <asm/byteorder.h>"
         |  ^~~~~


vim +/tcf_meta_create +326 net/sched/p4tc/p4tc_meta.c

   325	
 > 326	struct p4tc_metadata *tcf_meta_create(struct nlmsghdr *n, struct nlattr *nla,
   327					      u32 m_id, struct p4tc_pipeline *pipeline,
   328					      struct netlink_ext_ack *extack)
   329	{
   330		int ret = 0;
   331		struct p4tc_meta_size_params *sz_params;
   332		struct nlattr *tb[P4TC_META_MAX + 1];
   333		char *m_name;
   334	
   335		ret = nla_parse_nested(tb, P4TC_META_MAX, nla, p4tc_meta_policy,
   336				       extack);
   337		if (ret < 0)
   338			goto out;
   339	
   340		if (tcf_meta_find_byname_attr(tb[P4TC_META_NAME], pipeline) ||
   341		    tcf_meta_find_byid(pipeline, m_id)) {
   342			NL_SET_ERR_MSG(extack, "Metadatum already exists");
   343			ret = -EEXIST;
   344			goto out;
   345		}
   346	
   347		if (tb[P4TC_META_NAME]) {
   348			m_name = nla_data(tb[P4TC_META_NAME]);
   349		} else {
   350			NL_SET_ERR_MSG(extack, "Must specify metadatum name");
   351			ret = -ENOENT;
   352			goto out;
   353		}
   354	
   355		if (tb[P4TC_META_SIZE]) {
   356			sz_params = nla_data(tb[P4TC_META_SIZE]);
   357		} else {
   358			NL_SET_ERR_MSG(extack, "Must specify metadatum size params");
   359			ret = -ENOENT;
   360			goto out;
   361		}
   362	
   363		return __tcf_meta_create(pipeline, m_id, m_name, sz_params, GFP_KERNEL,
   364					 false, extack);
   365	
   366	out:
   367		return ERR_PTR(ret);
   368	}
   369	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
