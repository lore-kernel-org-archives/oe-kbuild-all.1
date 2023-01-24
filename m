Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9F88F4B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jan 2023 19:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674588438; x=1706124438;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TFnVytjys+ZzFR0tBGh761eQ3Ma6dxs9cHYepQoZc/I=;
  b=m1ABa12DslxWx3IUS8YeGkJ69E6KQxi65nugY5MyXnVDvHMfHJ8fezvI
   NJ3K7YXUQiH64wG/ZxripzvN8XGfc9KpMvpbn40/xkg71egn7zDum+Xbv
   1h8mpkD4mXst+4sU2fX65aZmUzpm9nX2yPLFf6SeGEgd2ptZ1pvmZ1rMx
   FAOn1vsGKh0mNWzHWJB+ZfxG5F7Dx95uGRMlp9LNXxR9gexhq7t0yYOiU
   xyLxhu5je47inm0DSitJ0Cw5TRHhWeYjtl4Ida6PNN9jZLadVwuyhrNrd
   KRmQBoILsd2PVbjRWYK78PuTtcfXX05apbU6j+6PqO/UINPvEW81DtzWV
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="306737742"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; 
   d="scan'208";a="306737742"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 11:27:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="692693341"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; 
   d="scan'208";a="692693341"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 24 Jan 2023 11:27:16 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKOwt-0006jA-2L;
	Tue, 24 Jan 2023 19:27:15 +0000
Date: Wed, 25 Jan 2023 03:26:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next RFC 10/20] net/kparser: add kParser
Message-ID: <202301250320.5xyTet53-lkp@intel.com>
References: <20230124170510.316970-10-jhs@mojatatu.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230124170510.316970-10-jhs@mojatatu.com>

Hi Jamal,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Jamal-Hadi-Salim/net-sched-act_api-increase-action-kind-string-length/20230125-010934
patch link:    https://lore.kernel.org/r/20230124170510.316970-10-jhs%40mojatatu.com
patch subject: [PATCH net-next RFC 10/20] net/kparser: add kParser
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230125/202301250320.5xyTet53-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/89890cfe5785baa53d2e7807c96715c394d4cd9c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jamal-Hadi-Salim/net-sched-act_api-increase-action-kind-string-length/20230125-010934
        git checkout 89890cfe5785baa53d2e7807c96715c394d4cd9c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash net/kparser/ net/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from net/kparser/kparser_condexpr.h:16,
                    from net/kparser/kparser.h:23,
                    from net/kparser/kparser_datapath.c:14:
   net/kparser/kparser_metaextract.h:23:2: error: #error "Cannot determine endianness"
      23 | #error "Cannot determine endianness"
         |  ^~~~~
>> net/kparser/kparser_datapath.c:726:5: warning: no previous prototype for '___kparser_parse' [-Wmissing-prototypes]
     726 | int ___kparser_parse(const void *obj, void *_hdr, size_t parse_len,
         |     ^~~~~~~~~~~~~~~~


vim +/___kparser_parse +726 net/kparser/kparser_datapath.c

   711	
   712	/* __kparser_parse(): Function to parse a void * packet buffer using a parser instance key.
   713	 *
   714	 * parser: Non NULL kparser_get_parser() returned and cached opaque pointer
   715	 * referencing a valid parser instance.
   716	 * _hdr: input packet buffer
   717	 * parse_len: length of input packet buffer
   718	 * _metadata: User provided metadata buffer. It must be same as configured
   719	 * metadata objects in CLI.
   720	 * metadata_len: Total length of the user provided metadata buffer.
   721	 *
   722	 * return: kParser error code as defined in include/uapi/linux/kparser.h
   723	 *
   724	 * rcu lock must be held before calling this function.
   725	 */
 > 726	int ___kparser_parse(const void *obj, void *_hdr, size_t parse_len,
   727			     struct sk_buff *skb, void *_metadata, size_t metadata_len)
   728	{
   729		return 0;
   730	}
   731	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
