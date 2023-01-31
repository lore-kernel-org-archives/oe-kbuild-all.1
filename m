Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF69D39D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Jan 2023 01:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675129410; x=1706665410;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+VYSfWTqoIXuGuIPejgJeGM77hFS/JkvVhKFfCWyEGM=;
  b=jHQ/506emtpotMm59khIHiQuNTimljWqr6HbMMBNlirr3UzqJs4OFBx0
   NpUgxQdrSxbHpAlOy4z6ou6BBhFZx4sGtnI+TylKWqQ9glDs4OdbhFgPB
   DdS/FAS1Kfp6wuttZ0IaVyrPDbfX8uiT2PFH8WEhHUu3UTXrQkuYdiY2b
   DwhpelxSPX1U/KK70zMNXKzsKz1QU4k1isOXv8bcLPXNtFg6tnjLlf21B
   sbbmqmzprIJDx0wPzdNRGrqSy8EzG+A7usZ+vkDYukipRSn82tLGOH2Ry
   SRJLmMpFJ6XB3jhSVHRVAFV9hEkadrPWQYzRIIlTgGcNkOT9OauUd49S8
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="326389799"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="326389799"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 17:43:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="614256027"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="614256027"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 30 Jan 2023 17:43:29 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMfgG-00043C-0V;
	Tue, 31 Jan 2023 01:43:28 +0000
Date: Tue, 31 Jan 2023 09:42:30 +0800
From: kernel test robot <lkp@intel.com>
To: Fan Wu <wufan@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v9 11/16] ipe: add support for dm-verity as a trust
 provider
Message-ID: <202301310952.jhQzLJbD-lkp@intel.com>
References: <1675119451-23180-12-git-send-email-wufan@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1675119451-23180-12-git-send-email-wufan@linux.microsoft.com>

Hi Fan,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on device-mapper-dm/for-next]
[also build test WARNING on axboe-block/for-next lwn/docs-next linus/master v6.2-rc6 next-20230130]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fan-Wu/security-add-ipe-lsm/20230131-070059
base:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git for-next
patch link:    https://lore.kernel.org/r/1675119451-23180-12-git-send-email-wufan%40linux.microsoft.com
patch subject: [RFC PATCH v9 11/16] ipe: add support for dm-verity as a trust provider
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230131/202301310952.jhQzLJbD-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7902ab6a956d4bc8bc6c114a6a8e5f5c64733a29
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Fan-Wu/security-add-ipe-lsm/20230131-070059
        git checkout 7902ab6a956d4bc8bc6c114a6a8e5f5c64733a29
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash security/ipe/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> security/ipe/policy_parser.c:289:5: warning: no previous prototype for 'parse_property' [-Wmissing-prototypes]
     289 | int parse_property(char *t, struct ipe_rule *r)
         |     ^~~~~~~~~~~~~~


vim +/parse_property +289 security/ipe/policy_parser.c

8cee25ff8fa64f Deven Bowers 2023-01-30  278  
8cee25ff8fa64f Deven Bowers 2023-01-30  279  /**
8cee25ff8fa64f Deven Bowers 2023-01-30  280   * parse_property - Parse the property type given a token string.
8cee25ff8fa64f Deven Bowers 2023-01-30  281   * @t: Supplies the token string to be parsed.
8cee25ff8fa64f Deven Bowers 2023-01-30  282   * @r: Supplies the ipe_rule the parsed property will be associated with.
8cee25ff8fa64f Deven Bowers 2023-01-30  283   *
8cee25ff8fa64f Deven Bowers 2023-01-30  284   * Return:
8cee25ff8fa64f Deven Bowers 2023-01-30  285   * * !IS_ERR	- OK
8cee25ff8fa64f Deven Bowers 2023-01-30  286   * * -ENOMEM	- Out of memory
8cee25ff8fa64f Deven Bowers 2023-01-30  287   * * -EBADMSG	- The supplied token cannot be parsed
8cee25ff8fa64f Deven Bowers 2023-01-30  288   */
8cee25ff8fa64f Deven Bowers 2023-01-30 @289  int parse_property(char *t, struct ipe_rule *r)
8cee25ff8fa64f Deven Bowers 2023-01-30  290  {
8cee25ff8fa64f Deven Bowers 2023-01-30  291  	substring_t args[MAX_OPT_ARGS];
8cee25ff8fa64f Deven Bowers 2023-01-30  292  	struct ipe_prop *p = NULL;
8cee25ff8fa64f Deven Bowers 2023-01-30  293  	int rc = 0;
8cee25ff8fa64f Deven Bowers 2023-01-30  294  	int token;
8cee25ff8fa64f Deven Bowers 2023-01-30  295  	char *dup = NULL;
8cee25ff8fa64f Deven Bowers 2023-01-30  296  
8cee25ff8fa64f Deven Bowers 2023-01-30  297  	p = kzalloc(sizeof(*p), GFP_KERNEL);
8cee25ff8fa64f Deven Bowers 2023-01-30  298  	if (!p) {
8cee25ff8fa64f Deven Bowers 2023-01-30  299  		rc = -ENOMEM;
8cee25ff8fa64f Deven Bowers 2023-01-30  300  		goto err;
8cee25ff8fa64f Deven Bowers 2023-01-30  301  	}
8cee25ff8fa64f Deven Bowers 2023-01-30  302  
8cee25ff8fa64f Deven Bowers 2023-01-30  303  	token = match_token(t, property_tokens, args);
8cee25ff8fa64f Deven Bowers 2023-01-30  304  
8cee25ff8fa64f Deven Bowers 2023-01-30  305  	switch (token) {
7902ab6a956d4b Deven Bowers 2023-01-30  306  	case ipe_prop_dmv_roothash:
7902ab6a956d4b Deven Bowers 2023-01-30  307  		dup = match_strdup(&args[0]);
7902ab6a956d4b Deven Bowers 2023-01-30  308  		if (!dup) {
7902ab6a956d4b Deven Bowers 2023-01-30  309  			rc = -ENOMEM;
7902ab6a956d4b Deven Bowers 2023-01-30  310  			goto err;
7902ab6a956d4b Deven Bowers 2023-01-30  311  		}
7902ab6a956d4b Deven Bowers 2023-01-30  312  		rc = ipe_digest_parse(dup, &p->value);
7902ab6a956d4b Deven Bowers 2023-01-30  313  		fallthrough;
cd129915862551 Deven Bowers 2023-01-30  314  	case ipe_prop_boot_verified_false:
cd129915862551 Deven Bowers 2023-01-30  315  	case ipe_prop_boot_verified_true:
7902ab6a956d4b Deven Bowers 2023-01-30  316  	case ipe_prop_dmv_sig_false:
7902ab6a956d4b Deven Bowers 2023-01-30  317  	case ipe_prop_dmv_sig_true:
cd129915862551 Deven Bowers 2023-01-30  318  		p->type = token;
cd129915862551 Deven Bowers 2023-01-30  319  		break;
8cee25ff8fa64f Deven Bowers 2023-01-30  320  	case ipe_prop_max:
8cee25ff8fa64f Deven Bowers 2023-01-30  321  	default:
8cee25ff8fa64f Deven Bowers 2023-01-30  322  		rc = -EBADMSG;
8cee25ff8fa64f Deven Bowers 2023-01-30  323  		break;
8cee25ff8fa64f Deven Bowers 2023-01-30  324  	}
8cee25ff8fa64f Deven Bowers 2023-01-30  325  	list_add_tail(&p->next, &r->props);
8cee25ff8fa64f Deven Bowers 2023-01-30  326  
8cee25ff8fa64f Deven Bowers 2023-01-30  327  err:
8cee25ff8fa64f Deven Bowers 2023-01-30  328  	kfree(dup);
8cee25ff8fa64f Deven Bowers 2023-01-30  329  	return rc;
8cee25ff8fa64f Deven Bowers 2023-01-30  330  }
8cee25ff8fa64f Deven Bowers 2023-01-30  331  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
