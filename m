Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA0D627
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jun 2023 01:56:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DA04C433C8;
	Fri, 16 Jun 2023 01:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686880575;
	bh=OMrztB5f5aWVHaax0etE1KC+gxL1dKu2eB+zSu8Cm6E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IsTqCGwRGDgSd9qDwyuM9cy3z7iV9MPhWNTIL7ZrrVAbu4WJCFw6YPDL36ttGL2Wr
	 jO2mCgkqGZfH2ebtPiHj919IarpChiw1KPT3udF8Qy/DFFzBEJzZjod+QaHfABBY42
	 4zDHKFp6mpXuRQCEyzE+TwQ2SU+30WevxwYLnEOjMYt45QbAlm5mDcrAnhOK2W1lC8
	 ylC5s1L5z1vTaDg/8f6Wd9QwseaUbKPQ+GBmQISkm14YxM8LzHbbOj5mroC71ZIC9i
	 sxLtNiFUNKaKHkSVM1b6B2iUU1NlRi2t16//xyQCkGjJobXUmrRquaSKjEj5VAkKJ/
	 LmHPCMCX3frLA==
Message-ID: <8dcc8bb3-b0e6-c062-be46-7a27fbd3a67c@kernel.org>
Date: Fri, 16 Jun 2023 10:56:13 +0900
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [mkp-scsi:for-next 70/83] ./usr/include/linux/ioprio.h:107:8:
 error: unknown type name '__always_inline'
To: Niklas Cassel <Niklas.Cassel@wdc.com>, kernel test robot <lkp@intel.com>
Cc: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Linus Walleij <linus.walleij@linaro.org>
References: <202306151347.WblKhRwQ-lkp@intel.com> <ZIrffaXbecwgjG7S@x1-carbon>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <ZIrffaXbecwgjG7S@x1-carbon>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/15/23 18:53, Niklas Cassel wrote:
> On Thu, Jun 15, 2023 at 02:00:21PM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
>> head:   aca416ac0b1fbe89d563f88cdb9884f986863d34
>> commit: bfaaaa3d9d09974828dc5c5d44eb2657a65d6b60 [70/83] scsi: block: Improve ioprio value validity checks
>> config: i386-randconfig-i012-20230614 (https://download.01.org/0day-ci/archive/20230615/202306151347.WblKhRwQ-lkp@intel.com/config)
>> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>> reproduce (this is a W=1 build):
>>         # https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git/commit/?id=bfaaaa3d9d09974828dc5c5d44eb2657a65d6b60
>>         git remote add mkp-scsi https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git
>>         git fetch --no-tags mkp-scsi for-next
>>         git checkout bfaaaa3d9d09974828dc5c5d44eb2657a65d6b60
>>         # save the config file
>>         mkdir build_dir && cp config build_dir/.config
>>         make W=1 O=build_dir ARCH=i386 olddefconfig
>>         make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202306151347.WblKhRwQ-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>    In file included from <command-line>:
>>>> ./usr/include/linux/ioprio.h:107:8: error: unknown type name '__always_inline'
>>      107 | static __always_inline __u16 ioprio_value(int class, int level, int hint)
>>          |        ^~~~~~~~~~~~~~~
>>>> ./usr/include/linux/ioprio.h:107:30: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'ioprio_value'
>>      107 | static __always_inline __u16 ioprio_value(int class, int level, int hint)
>>          |                              ^~~~~~~~~~~~
>>
>> -- 
>> 0-DAY CI Kernel Test Service
>> https://github.com/intel/lkp-tests/wiki
> 
> 
> If we really want to use __always_inline,
> I think that the uapi header should include:
> <linux/stddef.h>
> 
> see how e.g.
> include/uapi/linux/swab.h:#include <linux/stddef.h>
> which also uses __always_inline does it.
> 
> 
> (stddef.h includes compiler_attributes.h which redefines
> __always_inline to also include inline, and stddef.h also
> defines __always_inline if it isn't defined.)
> 
> 
> So I suppose:
> 1) either replace __always_inline with inline in ioprio.h
> or
> 2) let ioprio.h include <linux/stddef.h>

I replied to the problem notification email and forgot to add you... I think this:

diff --git a/include/uapi/linux/ioprio.h b/include/uapi/linux/ioprio.h
index 7310449c0178..92a769b9786d 100644
--- a/include/uapi/linux/ioprio.h
+++ b/include/uapi/linux/ioprio.h
@@ -2,6 +2,9 @@
 #ifndef _UAPI_LINUX_IOPRIO_H
 #define _UAPI_LINUX_IOPRIO_H

+#include <linux/stddef.h>
+#include <linux/types.h>
+
 /*
  * Gives us 8 prio classes with 13-bits of data for each class
  */

should do.

I basically followed what other uapi heder files using __always_inline do. The
addition of linux/types.h is to be safe for that "__u16" used also.

Never saw any error on my local builds though, and the buildbot did not complain
after the patch was submitted either. Not sure why.

> 
> 
> Kind regards,
> Niklas

-- 
Damien Le Moal
Western Digital Research

