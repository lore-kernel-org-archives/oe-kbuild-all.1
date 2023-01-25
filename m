Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EB4A2D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jan 2023 02:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674614916; x=1706150916;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5mIlqs4luThMmZkHFoB5QjUVLI4n6bToiUtCXIj6Q8o=;
  b=TRUeYEAYMI64i8zIbIkv2q8CmNT3Iu4TDpPuzuHB6a8larq+IHXmncFl
   A5ouusEPM29fQ/vvU9j/Th5Z2OUimJ70x/SUGMYwqa2wVVNkBY9h9xjLF
   pX39NPOTLvC3/jh/XPVieI10wij49oQNBdZXUV7lCtS10i4pwtbDqTJBx
   7EPwC5CrqNqLfh3vIKc+PpC2lLGWfb9IY/MKLHLSzNqJuZTX0m0rZq1gY
   flncJSUE3YsuZBJOtpLjDzr7X07Xz2YVMkpWXT4K+pq+ZteWCxlCK/DXt
   WvbGDTs2E6ziQ4UiLBYt+FJwWurV9UAx20OFdrQz+Ejo18o+c16Z9GeLZ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="310041085"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="310041085"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 18:48:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="725720508"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="725720508"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 24 Jan 2023 18:48:34 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKVpy-0006zV-09;
	Wed, 25 Jan 2023 02:48:34 +0000
Date: Wed, 25 Jan 2023 10:48:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next RFC 10/20] net/kparser: add kParser
Message-ID: <202301251032.zPceteqS-lkp@intel.com>
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
[auto build test ERROR on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Jamal-Hadi-Salim/net-sched-act_api-increase-action-kind-string-length/20230125-010934
patch link:    https://lore.kernel.org/r/20230124170510.316970-10-jhs%40mojatatu.com
patch subject: [PATCH net-next RFC 10/20] net/kparser: add kParser
config: i386-randconfig-r003-20230123 (https://download.01.org/0day-ci/archive/20230125/202301251032.zPceteqS-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/89890cfe5785baa53d2e7807c96715c394d4cd9c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jamal-Hadi-Salim/net-sched-act_api-increase-action-kind-string-length/20230125-010934
        git checkout 89890cfe5785baa53d2e7807c96715c394d4cd9c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/kparser.h:149:9: error: unknown type name 'bool'
     149 |         bool valid_entry;
         |         ^~~~
   ./usr/include/linux/kparser.h:154:9: error: unknown type name 'bool'
     154 |         bool reset_on_encap;
         |         ^~~~
   ./usr/include/linux/kparser.h:155:9: error: unknown type name 'bool'
     155 |         bool overwrite_last;
         |         ^~~~
   ./usr/include/linux/kparser.h:156:9: error: unknown type name 'bool'
     156 |         bool error_on_exceeded;
         |         ^~~~
>> ./usr/include/linux/kparser.h:198:56: error: C++ style comments are not allowed in ISO C90
     198 |         enum kparser_metadata_counter_op_type cntr_op; // 3 bit
         |                                                        ^
   ./usr/include/linux/kparser.h:198:56: note: (this will be reported only once per input file)
   ./usr/include/linux/kparser.h:199:9: error: unknown type name 'bool'
     199 |         bool frame;
         |         ^~~~
   ./usr/include/linux/kparser.h:200:9: error: unknown type name 'bool'
     200 |         bool e_bit;
         |         ^~~~
   ./usr/include/linux/kparser.h:235:9: error: unknown type name 'bool'
     235 |         bool endian;
         |         ^~~~
   ./usr/include/linux/kparser.h:250:9: error: unknown type name 'bool'
     250 |         bool len_parameterized;
         |         ^~~~
   ./usr/include/linux/kparser.h:253:9: error: unknown type name 'bool'
     253 |         bool cond_exprs_parameterized;
         |         ^~~~
   ./usr/include/linux/kparser.h:259:9: error: unknown type name 'bool'
     259 |         bool encap;
         |         ^~~~
   ./usr/include/linux/kparser.h:260:9: error: unknown type name 'bool'
     260 |         bool overlay;
         |         ^~~~
   ./usr/include/linux/kparser.h:276:9: error: unknown type name 'bool'
     276 |         bool len_parameterized;
         |         ^~~~
   ./usr/include/linux/kparser.h:283:9: error: unknown type name 'bool'
     283 |         bool tlvsstdfmt;
         |         ^~~~
   ./usr/include/linux/kparser.h:284:9: error: unknown type name 'bool'
     284 |         bool fixed_start_offset;
         |         ^~~~
   ./usr/include/linux/kparser.h:289:9: error: unknown type name 'bool'
     289 |         bool pad1_enable;
         |         ^~~~
   ./usr/include/linux/kparser.h:290:9: error: unknown type name 'bool'
     290 |         bool padn_enable;
         |         ^~~~
   ./usr/include/linux/kparser.h:291:9: error: unknown type name 'bool'
     291 |         bool eol_enable;
         |         ^~~~
   ./usr/include/linux/kparser.h:328:9: error: unknown type name 'bool'
     328 |         bool exceed_loop_cnt_is_err;
         |         ^~~~
   ./usr/include/linux/kparser.h:351:9: error: unknown type name 'bool'
     351 |         bool get_flags_parameterized;
         |         ^~~~
   ./usr/include/linux/kparser.h:353:9: error: unknown type name 'bool'
     353 |         bool start_fields_offset_parameterized;
         |         ^~~~
   ./usr/include/linux/kparser.h:355:9: error: unknown type name 'bool'
     355 |         bool flag_fields_len;
         |         ^~~~
   ./usr/include/linux/kparser.h:379:9: error: unknown type name 'bool'
     379 |         bool overlay_type_parameterized;
         |         ^~~~
   ./usr/include/linux/kparser.h:381:9: error: unknown type name 'bool'
     381 |         bool cond_exprs_parameterized;
         |         ^~~~
   ./usr/include/linux/kparser.h:388:9: error: unknown type name 'bool'
     388 |         bool is_padding;
         |         ^~~~
   ./usr/include/linux/kparser.h:413:9: error: unknown type name 'bool'
     413 |         bool endian;
         |         ^~~~
   ./usr/include/linux/kparser.h:435:9: error: unknown type name 'bool'
     435 |         bool add_entry;
         |         ^~~~
   ./usr/include/linux/kparser.h:646:19: error: unknown type name 'bool'
     646 | static __inline__ bool kparser_hkey_id_empty(const struct kparser_hkey *key)
         |                   ^~~~
   ./usr/include/linux/kparser.h: In function 'kparser_hkey_id_empty':
>> ./usr/include/linux/kparser.h:649:24: error: 'true' undeclared (first use in this function)
     649 |                 return true;
         |                        ^~~~
   ./usr/include/linux/kparser.h:649:24: note: each undeclared identifier is reported only once for each function it appears in
   ./usr/include/linux/kparser.h: At top level:
   ./usr/include/linux/kparser.h:653:19: error: unknown type name 'bool'
     653 | static __inline__ bool kparser_hkey_name_empty(const struct kparser_hkey *key)
         |                   ^~~~
   ./usr/include/linux/kparser.h: In function 'kparser_hkey_name_empty':
   ./usr/include/linux/kparser.h:656:24: error: 'true' undeclared (first use in this function)
     656 |                 return true;
         |                        ^~~~
   ./usr/include/linux/kparser.h: At top level:
   ./usr/include/linux/kparser.h:661:19: error: unknown type name 'bool'
     661 | static __inline__ bool kparser_hkey_empty(const struct kparser_hkey *key)
         |                   ^~~~
   ./usr/include/linux/kparser.h:666:19: error: unknown type name 'bool'
     666 | static __inline__ bool kparser_hkey_user_id_invalid(const struct kparser_hkey *key)
         |                   ^~~~
   ./usr/include/linux/kparser.h: In function 'kparser_hkey_user_id_invalid':
   ./usr/include/linux/kparser.h:669:24: error: 'true' undeclared (first use in this function)
     669 |                 return true;
         |                        ^~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
