Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF8010EB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Nov 2022 06:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667544643; x=1699080643;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=q040YY6IfTO8zwrwAiF7g0BqW0FZCt8RdRgr5l1GCD0=;
  b=L8wmzn+2cPjfI3QKQztr+5lh/rgs60zYHReIIqNPRnbDzEk8pEmePlax
   jPhYZu1f9HtvVF+hUdQ4aLyuVn+Dm9ecjhNbkTFgDyeY6ZFM5kLyyiDyC
   7BF5kDeKcAWE5TRs6Bj6uyh6i90PVd8B275+hb8Wkt+E9yUGI5r/mx/H3
   kaatfGC+V7w+09jyK7cxTMByEyN9JjvYDUcD7SM/N5qtMRWwZiAEFj02E
   iuJ0CNZcNa5plI34+aHcxfe14a2Ea0WUjayKp0d0kmSn37JG/pj8UmYhF
   vQr7cKux8t4HrF3Lcg4397/75/5jrdRO51A08OnVz4VObgF7wWs41ZnHo
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="290285358"
X-IronPort-AV: E=Sophos;i="5.96,136,1665471600"; 
   d="scan'208";a="290285358"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2022 23:50:42 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="740514691"
X-IronPort-AV: E=Sophos;i="5.96,136,1665471600"; 
   d="scan'208";a="740514691"
Received: from yuhongwe-mobl.ccr.corp.intel.com (HELO [10.254.215.240]) ([10.254.215.240])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2022 23:50:41 -0700
Subject: Re: drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3289
 pvr2_hdw_get_tuner_status() warn: inconsistent indenting
To: Kees Cook <keescook@chromium.org>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
References: <202211012349.5BDBLCup-lkp@intel.com>
 <202211011441.0AB5FB92B6@keescook>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <41e51edd-4246-717d-550c-87a4320aeb99@intel.com>
Date: Fri, 4 Nov 2022 14:50:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202211011441.0AB5FB92B6@keescook>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11/2/2022 5:42 AM, Kees Cook wrote:
> On Tue, Nov 01, 2022 at 11:19:40PM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> head:   5aaef24b5c6d4246b2cac1be949869fa36577737
>> commit: f68f2ff91512c199ec24883001245912afc17873 fortify: Detect struct member overflows in memcpy() at compile-time
>> date:   9 months ago
>> config: x86_64-randconfig-m001-20221031
>> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
>>
>> If you fix the issue, kindly add following tag where applicable
>> | Reported-by: kernel test robot <lkp@intel.com>
>>
>> smatch warnings:
>> drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3289 pvr2_hdw_get_tuner_status() warn: inconsistent indenting
> 
> Hi!
> 
> I have no idea why this is being reported to me. The fortify changes
> have nothing to do with the indenting in pvrusb2-hdw.c. :)

Hi Kees,

Sorry for the noise, the commit here is not the root cause, we'll add it 
to ignore list.

Best Regards,
Rong Chen

> 
> -Kees
> 
>>
>> vim +3289 drivers/media/usb/pvrusb2/pvrusb2-hdw.c
>>
>> 432907f750b27a drivers/media/video/pvrusb2/pvrusb2-hdw.c Mike Isely 2008-08-31  3279
>> 432907f750b27a drivers/media/video/pvrusb2/pvrusb2-hdw.c Mike Isely 2008-08-31  3280
>> 18103c57b0168e drivers/media/video/pvrusb2/pvrusb2-hdw.c Mike Isely 2007-01-20  3281  /* Return information about the tuner */
>> 18103c57b0168e drivers/media/video/pvrusb2/pvrusb2-hdw.c Mike Isely 2007-01-20  3282  int pvr2_hdw_get_tuner_status(struct pvr2_hdw *hdw,struct v4l2_tuner *vtp)
>> 18103c57b0168e drivers/media/video/pvrusb2/pvrusb2-hdw.c Mike Isely 2007-01-20  3283  {
>> 18103c57b0168e drivers/media/video/pvrusb2/pvrusb2-hdw.c Mike Isely 2007-01-20  3284  	LOCK_TAKE(hdw->big_lock); do {
>> 18103c57b0168e drivers/media/video/pvrusb2/pvrusb2-hdw.c Mike Isely 2007-01-20  3285  		if (hdw->tuner_signal_stale) {
>> a51f5000b79100 drivers/media/video/pvrusb2/pvrusb2-hdw.c Mike Isely 2009-03-06  3286  			pvr2_hdw_status_poll(hdw);
>> 18103c57b0168e drivers/media/video/pvrusb2/pvrusb2-hdw.c Mike Isely 2007-01-20  3287  		}
>> 18103c57b0168e drivers/media/video/pvrusb2/pvrusb2-hdw.c Mike Isely 2007-01-20  3288  		memcpy(vtp,&hdw->tuner_signal_info,sizeof(struct v4l2_tuner));
>> 18103c57b0168e drivers/media/video/pvrusb2/pvrusb2-hdw.c Mike Isely 2007-01-20 @3289  	} while (0); LOCK_GIVE(hdw->big_lock);
>> 18103c57b0168e drivers/media/video/pvrusb2/pvrusb2-hdw.c Mike Isely 2007-01-20  3290  	return 0;
>> d855497edbfbf9 drivers/media/video/pvrusb2/pvrusb2-hdw.c Mike Isely 2006-06-26  3291  }
>> d855497edbfbf9 drivers/media/video/pvrusb2/pvrusb2-hdw.c Mike Isely 2006-06-26  3292
>>
>> :::::: The code at line 3289 was first introduced by commit
>> :::::: 18103c57b0168ebc0401702d483fe131f0aecc7a V4L/DVB (5081): Pvrusb2: VIDIOC_G_TUNER cleanup
>>
>> :::::: TO: Mike Isely <isely@pobox.com>
>> :::::: CC: Mauro Carvalho Chehab <mchehab@infradead.org>
>>
>> -- 
>> 0-DAY CI Kernel Test Service
>> https://01.org/lkp
> 
