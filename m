Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10A97EC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Mar 2024 01:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710119862; cv=none; b=kn1KjI+Bcz4XxkQSkc8v4qypkOJ6oWf/BCNdfRzycjVRrMKeSP+zRnyOtobiJDvS8C91wkf3GfL+2k6JyE9Deay9BkuDN/liwx4yxwqtElRUgyTEe/ZQFXfIkWNUjZWv3N27kxEiPqHiXC4g2hWQKoGWbm4FjzMd/c5nFHnEAcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710119862; c=relaxed/simple;
	bh=UGpiGR+bj+jNMMKgQF1FJ4/NU7fqwhisAU1ZdV5siYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kIa467jAjzEmuNLl4AZqlb8gryyJF1oJnBwTsyM4tKVwbm80WtVWJxQEpSdblBRjV6Dp2KaSNhdFgUNilMvGOqdkbJupwZrxRbBFLlMDBlAqUUXIOb3oSTUK7EI7rj6Ugm3Ug+2JezAlxyjAlrCctCbhOK5uh4vryG/raOhhJ3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JWZkRfoa; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JWZkRfoa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710119861; x=1741655861;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UGpiGR+bj+jNMMKgQF1FJ4/NU7fqwhisAU1ZdV5siYs=;
  b=JWZkRfoag73PNrZE5PVHOoODFN9hy3P50kqS+wEV+qK+3HE06xWzY8W+
   Omn+bNBMWxn+7jRuFy4jsz4tWx6yd6FroCHJ4VazpCbRlaA/R/1vElhNj
   QbhzXUi4vuLIan1N/FJLqX/Zp+0+P8v8+YmD8t2+28UjwvBB2FkI1b+pk
   +UVOo2QsAIubPni7pUZM5S7K1f70Xw+hg67/nIprmMUS44Z12fNjEh2cN
   MoePfpvWYUQqoT0lclbzdz0Ve6KVdfT0ndvYA+bTO5dzeNqq0EtNKmSaL
   17ZY2nLBAV/BHlkQ0gYOnQruurB8vOWVGxQMFUXFA7EOe5KL/UeFAPh8I
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="27237942"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="27237942"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 18:17:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="11068462"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Mar 2024 18:17:26 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjUI8-0008mN-0R;
	Mon, 11 Mar 2024 01:17:24 +0000
Date: Mon, 11 Mar 2024 09:17:08 +0800
From: kernel test robot <lkp@intel.com>
To: Ian Rogers <irogers@google.com>, Arnd Bergmann <arnd@arndb.de>,
	Andrii Nakryiko <andrii@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH v1 12/13] tools headers: Sync compiler.h headers
Message-ID: <202403110904.yrRIQbOJ-lkp@intel.com>
References: <20240310020509.647319-13-irogers@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240310020509.647319-13-irogers@google.com>

Hi Ian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on perf-tools-next/perf-tools-next]
[also build test WARNING on perf-tools/perf-tools tip/perf/core]
[cannot apply to linus/master acme/perf/core v6.8 next-20240308]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ian-Rogers/tools-bpf-Synchronize-bpf-h-with-kernel-uapi-version/20240310-101251
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20240310020509.647319-13-irogers%40google.com
patch subject: [PATCH v1 12/13] tools headers: Sync compiler.h headers
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240311/202403110904.yrRIQbOJ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403110904.yrRIQbOJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403110904.yrRIQbOJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from tools/objtool/include/objtool/arch.h:11,
                    from tools/objtool/include/objtool/check.h:11,
                    from tools/objtool/include/objtool/special.h:10,
                    from special.c:16:
>> tools/objtool/include/objtool/objtool.h:15: warning: "__weak" redefined
      15 | #define __weak __attribute__((weak))
         | 
   In file included from tools/include/linux/compiler_types.h:74,
                    from tools/include/linux/compiler.h:5,
                    from tools/include/linux/build_bug.h:5,
                    from tools/include/linux/kernel.h:8,
                    from tools/objtool/libsubcmd/include/subcmd/parse-options.h:5,
                    from tools/objtool/include/objtool/builtin.h:8,
                    from special.c:15:
   tools/include/linux/compiler_attributes.h:437: note: this is the location of the previous definition
     437 | # define __weak                          __attribute__((__weak__))
         | 
   In file included from weak.c:10:
>> tools/objtool/include/objtool/objtool.h:15: warning: "__weak" redefined
      15 | #define __weak __attribute__((weak))
         | 
   In file included from tools/include/linux/compiler_types.h:74,
                    from tools/include/linux/compiler.h:5,
                    from tools/include/linux/build_bug.h:5,
                    from tools/include/linux/kernel.h:8,
                    from tools/include/linux/list.h:7,
                    from tools/objtool/include/objtool/objtool.h:10,
                    from weak.c:10:
   tools/include/linux/compiler_attributes.h:437: note: this is the location of the previous definition
     437 | # define __weak                          __attribute__((__weak__))
         | 
   In file included from tools/objtool/include/objtool/arch.h:11,
                    from tools/objtool/include/objtool/check.h:11,
                    from tools/objtool/include/objtool/special.h:10,
                    from arch/x86/special.c:4:
>> tools/objtool/include/objtool/objtool.h:15: warning: "__weak" redefined
      15 | #define __weak __attribute__((weak))
         | 
   In file included from tools/include/linux/compiler_types.h:74,
                    from tools/include/linux/compiler.h:5,
                    from tools/include/linux/build_bug.h:5,
                    from tools/include/linux/kernel.h:8,
                    from tools/include/linux/list.h:7,
                    from tools/objtool/include/objtool/cfi.h:10,
                    from tools/objtool/include/objtool/check.h:10,
                    from tools/objtool/include/objtool/special.h:10,
                    from arch/x86/special.c:4:
   tools/include/linux/compiler_attributes.h:437: note: this is the location of the previous definition
     437 | # define __weak                          __attribute__((__weak__))
         | 
   In file included from tools/objtool/include/objtool/arch.h:11,
                    from check.c:13:
>> tools/objtool/include/objtool/objtool.h:15: warning: "__weak" redefined
      15 | #define __weak __attribute__((weak))
         | 
   In file included from tools/include/linux/compiler_types.h:74,
                    from tools/include/linux/compiler.h:5,
                    from tools/include/linux/build_bug.h:5,
                    from tools/include/linux/kernel.h:8,
                    from tools/objtool/libsubcmd/include/subcmd/parse-options.h:5,
                    from tools/objtool/include/objtool/builtin.h:8,
                    from check.c:11:
   tools/include/linux/compiler_attributes.h:437: note: this is the location of the previous definition
     437 | # define __weak                          __attribute__((__weak__))
         | 
   In file included from builtin-check.c:10:
>> tools/objtool/include/objtool/objtool.h:15: warning: "__weak" redefined
      15 | #define __weak __attribute__((weak))
         | 
   In file included from tools/include/linux/compiler_types.h:74,
                    from tools/include/linux/compiler.h:5,
                    from tools/include/linux/build_bug.h:5,
                    from tools/include/linux/kernel.h:8,
                    from tools/objtool/libsubcmd/include/subcmd/parse-options.h:5,
                    from builtin-check.c:6:
   tools/include/linux/compiler_attributes.h:437: note: this is the location of the previous definition
     437 | # define __weak                          __attribute__((__weak__))
         | 
   In file included from tools/objtool/include/objtool/arch.h:11,
                    from tools/objtool/include/objtool/check.h:11,
                    from orc_gen.c:12:
>> tools/objtool/include/objtool/objtool.h:15: warning: "__weak" redefined
      15 | #define __weak __attribute__((weak))
         | 
   In file included from tools/include/linux/compiler_types.h:74,
                    from tools/include/linux/compiler.h:5,
                    from tools/arch/x86/include/asm/orc_types.h:10,
                    from orc_gen.c:10:
   tools/include/linux/compiler_attributes.h:437: note: this is the location of the previous definition
     437 | # define __weak                          __attribute__((__weak__))
         | 
   In file included from orc_dump.c:8:
>> tools/objtool/include/objtool/objtool.h:15: warning: "__weak" redefined
      15 | #define __weak __attribute__((weak))
         | 
   In file included from tools/include/linux/compiler_types.h:74,
                    from tools/include/linux/compiler.h:5,
                    from tools/arch/x86/include/asm/orc_types.h:10,
                    from orc_dump.c:7:
   tools/include/linux/compiler_attributes.h:437: note: this is the location of the previous definition
     437 | # define __weak                          __attribute__((__weak__))
         | 
   In file included from objtool.c:16:
>> tools/objtool/include/objtool/objtool.h:15: warning: "__weak" redefined
      15 | #define __weak __attribute__((weak))
         | 
   In file included from tools/include/linux/compiler_types.h:74,
                    from tools/include/linux/compiler.h:5,
                    from tools/include/linux/build_bug.h:5,
                    from tools/include/linux/kernel.h:8,
                    from objtool.c:13:
   tools/include/linux/compiler_attributes.h:437: note: this is the location of the previous definition
     437 | # define __weak                          __attribute__((__weak__))
         | 
   In file included from tools/objtool/include/objtool/arch.h:11,
                    from tools/objtool/include/objtool/check.h:11,
                    from arch/x86/decode.c:18:
>> tools/objtool/include/objtool/objtool.h:15: warning: "__weak" redefined
      15 | #define __weak __attribute__((weak))
         | 
   In file included from tools/include/linux/compiler_types.h:74,
                    from tools/include/linux/compiler.h:5,
                    from tools/include/linux/build_bug.h:5,
                    from tools/include/linux/kernel.h:8,
                    from arch/x86/../../../arch/x86/lib/insn.c:8,
                    from arch/x86/decode.c:12:
   tools/include/linux/compiler_attributes.h:437: note: this is the location of the previous definition
     437 | # define __weak                          __attribute__((__weak__))
         | 
--
   In file included from weak.c:10:
>> tools/objtool/include/objtool/objtool.h:15: warning: "__weak" redefined
      15 | #define __weak __attribute__((weak))
         | 
   In file included from tools/include/linux/compiler_types.h:74,
                    from tools/include/linux/compiler.h:5,
                    from tools/include/linux/build_bug.h:5,
                    from tools/include/linux/kernel.h:8,
                    from tools/include/linux/list.h:7,
                    from tools/objtool/include/objtool/objtool.h:10,
                    from weak.c:10:
   tools/include/linux/compiler_attributes.h:437: note: this is the location of the previous definition
     437 | # define __weak                          __attribute__((__weak__))
         | 
   In file included from tools/objtool/include/objtool/arch.h:11,
                    from tools/objtool/include/objtool/check.h:11,
                    from tools/objtool/include/objtool/special.h:10,
                    from special.c:16:
>> tools/objtool/include/objtool/objtool.h:15: warning: "__weak" redefined
      15 | #define __weak __attribute__((weak))
         | 
   In file included from tools/include/linux/compiler_types.h:74,
                    from tools/include/linux/compiler.h:5,
                    from tools/include/linux/build_bug.h:5,
                    from tools/include/linux/kernel.h:8,
                    from tools/objtool/libsubcmd/include/subcmd/parse-options.h:5,
                    from tools/objtool/include/objtool/builtin.h:8,
                    from special.c:15:
   tools/include/linux/compiler_attributes.h:437: note: this is the location of the previous definition
     437 | # define __weak                          __attribute__((__weak__))
         | 
   In file included from tools/objtool/include/objtool/arch.h:11,
                    from check.c:13:
>> tools/objtool/include/objtool/objtool.h:15: warning: "__weak" redefined
      15 | #define __weak __attribute__((weak))
         | 
   In file included from tools/include/linux/compiler_types.h:74,
                    from tools/include/linux/compiler.h:5,
                    from tools/include/linux/build_bug.h:5,
                    from tools/include/linux/kernel.h:8,
                    from tools/objtool/libsubcmd/include/subcmd/parse-options.h:5,
                    from tools/objtool/include/objtool/builtin.h:8,
                    from check.c:11:
   tools/include/linux/compiler_attributes.h:437: note: this is the location of the previous definition
     437 | # define __weak                          __attribute__((__weak__))
         | 
   In file included from builtin-check.c:10:
>> tools/objtool/include/objtool/objtool.h:15: warning: "__weak" redefined
      15 | #define __weak __attribute__((weak))
         | 
   In file included from tools/include/linux/compiler_types.h:74,
                    from tools/include/linux/compiler.h:5,
                    from tools/include/linux/build_bug.h:5,
                    from tools/include/linux/kernel.h:8,
                    from tools/objtool/libsubcmd/include/subcmd/parse-options.h:5,
                    from builtin-check.c:6:
   tools/include/linux/compiler_attributes.h:437: note: this is the location of the previous definition
     437 | # define __weak                          __attribute__((__weak__))
         | 
   In file included from tools/objtool/include/objtool/arch.h:11,
                    from tools/objtool/include/objtool/check.h:11,
                    from tools/objtool/include/objtool/special.h:10,
                    from arch/x86/special.c:4:
>> tools/objtool/include/objtool/objtool.h:15: warning: "__weak" redefined
      15 | #define __weak __attribute__((weak))
         | 
   In file included from tools/include/linux/compiler_types.h:74,
                    from tools/include/linux/compiler.h:5,
                    from tools/include/linux/build_bug.h:5,
                    from tools/include/linux/kernel.h:8,
                    from tools/include/linux/list.h:7,
                    from tools/objtool/include/objtool/cfi.h:10,
                    from tools/objtool/include/objtool/check.h:10,
                    from tools/objtool/include/objtool/special.h:10,
                    from arch/x86/special.c:4:
   tools/include/linux/compiler_attributes.h:437: note: this is the location of the previous definition
     437 | # define __weak                          __attribute__((__weak__))
         | 
   In file included from objtool.c:16:
>> tools/objtool/include/objtool/objtool.h:15: warning: "__weak" redefined
      15 | #define __weak __attribute__((weak))
         | 
   In file included from tools/include/linux/compiler_types.h:74,
                    from tools/include/linux/compiler.h:5,
                    from tools/include/linux/build_bug.h:5,
                    from tools/include/linux/kernel.h:8,
                    from objtool.c:13:
   tools/include/linux/compiler_attributes.h:437: note: this is the location of the previous definition
     437 | # define __weak                          __attribute__((__weak__))
         | 
   In file included from orc_dump.c:8:
>> tools/objtool/include/objtool/objtool.h:15: warning: "__weak" redefined
      15 | #define __weak __attribute__((weak))
         | 
   In file included from tools/include/linux/compiler_types.h:74,
                    from tools/include/linux/compiler.h:5,
                    from tools/arch/x86/include/asm/orc_types.h:10,
                    from orc_dump.c:7:
   tools/include/linux/compiler_attributes.h:437: note: this is the location of the previous definition
     437 | # define __weak                          __attribute__((__weak__))
         | 
   In file included from tools/objtool/include/objtool/arch.h:11,
                    from tools/objtool/include/objtool/check.h:11,
                    from orc_gen.c:12:
>> tools/objtool/include/objtool/objtool.h:15: warning: "__weak" redefined
      15 | #define __weak __attribute__((weak))
         | 
   In file included from tools/include/linux/compiler_types.h:74,
                    from tools/include/linux/compiler.h:5,
                    from tools/arch/x86/include/asm/orc_types.h:10,
                    from orc_gen.c:10:
   tools/include/linux/compiler_attributes.h:437: note: this is the location of the previous definition
     437 | # define __weak                          __attribute__((__weak__))
         | 
   In file included from tools/objtool/include/objtool/arch.h:11,
                    from tools/objtool/include/objtool/check.h:11,
                    from arch/x86/decode.c:18:
>> tools/objtool/include/objtool/objtool.h:15: warning: "__weak" redefined
      15 | #define __weak __attribute__((weak))
         | 
   In file included from tools/include/linux/compiler_types.h:74,
                    from tools/include/linux/compiler.h:5,
                    from tools/include/linux/build_bug.h:5,
                    from tools/include/linux/kernel.h:8,
                    from arch/x86/../../../arch/x86/lib/insn.c:8,
                    from arch/x86/decode.c:12:
   tools/include/linux/compiler_attributes.h:437: note: this is the location of the previous definition
     437 | # define __weak                          __attribute__((__weak__))
         | 


vim +/__weak +15 tools/objtool/include/objtool/objtool.h

d37c90d47fc465 tools/objtool/objtool.h Matt Helsley   2020-05-19  14  
eda3dc905834dc tools/objtool/objtool.h Julien Thierry 2020-09-04 @15  #define __weak __attribute__((weak))
eda3dc905834dc tools/objtool/objtool.h Julien Thierry 2020-09-04  16  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
