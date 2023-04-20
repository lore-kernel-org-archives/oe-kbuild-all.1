Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7D01844
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 03:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681963037; x=1713499037;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dv8Sq13xaCMnIsK0VNgPAd8PR+UU69iWhtLhEZQF1kw=;
  b=av8TfpiETPLHAA7OhiLU/JUYcOjatWDwFSgjNDY+4pIrc/2zVq9igHr+
   YGpcT8gUJGTejnJLKRFLkXdcQ1CfBsKRLbo8bnLitPtCsefBcsIV4wejT
   NB50EHsmACGMzD6e4DQ/VPVl5Vrb63Fr4MMoueNhhysw+VSeL0oauLgTn
   swPYEvVlp/B7OT/GH/2sMp8o5rtO0hgg4okuKPxiQPO5EuViiCsADJjyz
   xqN9ugw7LH9KNGO7sHemkds3JNQpgDnucaqLH7oId300yUVj+AdZI2fdn
   6KxEW3xKZz7z7oY4qJ59f9aYZ2qHV6eSRR1R/pslWOQNiEoRBUoRIUEw9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="410861234"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="410861234"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 20:57:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="835556212"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="835556212"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 19 Apr 2023 20:57:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppLQ2-000fRO-1F;
	Thu, 20 Apr 2023 03:57:14 +0000
Date: Thu, 20 Apr 2023 11:57:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jorge Lopez <jorgealtxwork@gmail.com>, hdegoede@redhat.com,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas@t-8ch.de
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v10 13/14] HP BIOSCFG driver  - Makefile
Message-ID: <202304201100.r6QLG0Fc-lkp@intel.com>
References: <20230419151321.6167-14-jorge.lopez2@hp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230419151321.6167-14-jorge.lopez2@hp.com>

Hi Jorge,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.3-rc7 next-20230419]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jorge-Lopez/HP-BIOSCFG-driver-Documentation/20230419-231828
patch link:    https://lore.kernel.org/r/20230419151321.6167-14-jorge.lopez2%40hp.com
patch subject: [PATCH v10 13/14] HP BIOSCFG driver  - Makefile
config: i386-randconfig-s002-20230417 (https://download.01.org/0day-ci/archive/20230420/202304201100.r6QLG0Fc-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/cfbebfbd4ed15793fab894715bfd74387adcf4f1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jorge-Lopez/HP-BIOSCFG-driver-Documentation/20230419-231828
        git checkout cfbebfbd4ed15793fab894715bfd74387adcf4f1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/platform/x86/hp/hp-bioscfg/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304201100.r6QLG0Fc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c:80:23: sparse: sparse: symbol 'sure_start_audit_log_entries' was not declared. Should it be static?
--
>> drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c:191:23: sparse: sparse: symbol 'password_spm_status' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
