Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D0710EB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Nov 2022 07:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667546454; x=1699082454;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=jLozXZd9t3a7mI/Ru02vCIY5zjtAlB/7OfJd6d6CeRY=;
  b=ZMsDjmzNj1TaNmfTchomE8qc5BSuVcIpSOhV2BldiioJ9RjV9fp7G9UU
   T5yLhZipSu2aFP8UKxvwYlKcBX+g+7ZetFHlr9HlwlnSHOPaQc2prVjxV
   Um+YfEWaj20NR22WoY8u56b4GMdlsDG0wM9UYvG1ksiVTeL5S79HsVvbw
   1lpftvbyhwYqVTHXm7+MDAoxFnDvJKCDPQF5OQQS0n+kWgWC+zJHn419b
   CIBmqh1Td+H+rfU8moBR0x5ijJ7D8d6a4L2mWS2hca6frK/fH4G2GDPJw
   VM+0FMbI/FLICVo0066AlfIRa2oEO7i0TJyuYfSLmbMagU9Bi6piKjKC1
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="372008790"
X-IronPort-AV: E=Sophos;i="5.96,136,1665471600"; 
   d="scan'208";a="372008790"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2022 00:20:53 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="880199457"
X-IronPort-AV: E=Sophos;i="5.96,136,1665471600"; 
   d="scan'208";a="880199457"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.254.215.240]) ([10.254.215.240])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2022 00:20:52 -0700
Subject: Re: arch/powerpc/kexec/crash.c:311:22: error: variable 'i' might be
 clobbered by 'longjmp' or 'vfork'
To: Alexander Potapenko <glider@google.com>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, =?UTF-8?Q?Maciej_=c5=bbenczykowski?=
 <maze@google.com>
References: <202210310123.aklkcZzK-lkp@intel.com>
 <CAG_fn=VqT+ORnMwR=YCsp6SxOMESqL9-O_t8G-5BdsNNBe13Mg@mail.gmail.com>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <ad55edce-7929-a2b7-4882-9ab9789d76e0@intel.com>
Date: Fri, 4 Nov 2022 15:20:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAG_fn=VqT+ORnMwR=YCsp6SxOMESqL9-O_t8G-5BdsNNBe13Mg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 10/31/2022 4:27 PM, Alexander Potapenko wrote:
> Looks unrelated to this 2-year old commit?

Hi Alexander,

Sorry for the inconvenience, the commit here is not the root cause for
this error, we'll add it to ignore list.

Best Regards,
Rong Chen


> 
> On Sun, Oct 30, 2022 at 6:12 PM kernel test robot <lkp@intel.com> wrote:
>>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> head:   882ad2a2a8ffa1defecdf907052f04da2737dc46
>> commit: f0fe00d4972a8cd4b98cc2c29758615e4d51cdfe security: allow using Clang's zero initialization for stack variables
>> date:   2 years, 4 months ago
>> config: powerpc-wii_defconfig
>> compiler: powerpc-linux-gcc (GCC) 12.1.0
>> reproduce (this is a W=1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f0fe00d4972a8cd4b98cc2c29758615e4d51cdfe
>>          git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>>          git fetch --no-tags linus master
>>          git checkout f0fe00d4972a8cd4b98cc2c29758615e4d51cdfe
>>          # save the config file
>>          mkdir build_dir && cp config build_dir/.config
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/
>>
>> If you fix the issue, kindly add following tag where applicable
>> | Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>     arch/powerpc/kexec/crash.c: In function 'default_machine_crash_shutdown':
>>>> arch/powerpc/kexec/crash.c:311:22: error: variable 'i' might be clobbered by 'longjmp' or 'vfork' [-Werror=clobbered]
>>       311 |         unsigned int i;
>>           |                      ^
>>     cc1: all warnings being treated as errors
>>
>>
>> vim +311 arch/powerpc/kexec/crash.c
>>
>> 496b010e1e70a9 arch/powerpc/kernel/crash.c Michael Neuling  2008-01-18  308
>> cc53291521701f arch/powerpc/kernel/crash.c Michael Ellerman 2005-12-04  309  void default_machine_crash_shutdown(struct pt_regs *regs)
>> cc53291521701f arch/powerpc/kernel/crash.c Michael Ellerman 2005-12-04  310  {
>> 496b010e1e70a9 arch/powerpc/kernel/crash.c Michael Neuling  2008-01-18 @311     unsigned int i;
>>
>> :::::: The code at line 311 was first introduced by commit
>> :::::: 496b010e1e70a9b4286fa34f19523f24a194f119 [POWERPC] kdump shutdown hook support
>>
>> :::::: TO: Michael Neuling <mikey@neuling.org>
>> :::::: CC: Paul Mackerras <paulus@samba.org>
>>
>> --
>> 0-DAY CI Kernel Test Service
>> https://01.org/lkp
> 
> 
> 
