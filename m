Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5325D29414
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Nov 2023 13:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BRQGO5Ae"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699362356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zlk7p9iBj7OD0gCjK31pEUwIfLq+WakAWybWYHiDH24=;
	b=BRQGO5AeCUzVa1nzFfMVuBjwCsFB58pzOM4tpLKK3UHFfdn9GAdF87R0LbWiTtYKZzMnjm
	PW+A+Wc3tH6DLgxYJum+H7g7QxQqFimj+xdOdNPGjtwsCpp1MlZTrAo+KTmp9QQ3YmIYEo
	T2LlkTeWFY+Hk1UwZIPODalHDPaxoG4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-246-Yo85CDHmPj-ZXdhiFEJA0g-1; Tue,
 07 Nov 2023 08:05:53 -0500
X-MC-Unique: Yo85CDHmPj-ZXdhiFEJA0g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66B3F1C0BA4E;
	Tue,  7 Nov 2023 13:05:52 +0000 (UTC)
Received: from localhost (unknown [10.72.113.88])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BAA6CC15983;
	Tue,  7 Nov 2023 13:05:51 +0000 (UTC)
Date: Tue, 7 Nov 2023 21:05:48 +0800
From: Baoquan He <bhe@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 6/9] x86: kdump: use generic interface to simplify
 crashkernel reservation code
Message-ID: <ZUo2LHDUn9KaunJd@MiWiFi-R3L-srv>
References: <20230914033142.676708-7-bhe@redhat.com>
 <202311071923.uYbShjYE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202311071923.uYbShjYE-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 11/07/23 at 07:11pm, kernel test robot wrote:
> Hi Baoquan,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on powerpc/next]
> [also build test WARNING on powerpc/fixes v6.6]
> [cannot apply to arm64/for-next/core tip/x86/core linus/master next-20231107]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/crash_core-c-remove-unnecessary-parameter-of-function/20230914-113546
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
> patch link:    https://lore.kernel.org/r/20230914033142.676708-7-bhe%40redhat.com
> patch subject: [PATCH v3 6/9] x86: kdump: use generic interface to simplify crashkernel reservation code
> config: i386-randconfig-011-20230914 (https://download.01.org/0day-ci/archive/20231107/202311071923.uYbShjYE-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231107/202311071923.uYbShjYE-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311071923.uYbShjYE-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> arch/x86/kernel/setup.c:476:15: warning: no previous prototype for 'crash_low_size_default' [-Wmissing-prototypes]
>      476 | unsigned long crash_low_size_default(void)
>          |               ^~~~~~~~~~~~~~~~~~~~~~

I didn't try the reproducer at above, whereas this should be an report
on an old version of patch. The patch has been updated later and merged
into linus's tree now. Please see below commit

commit 9c08a2a139fe83f217625ee0352ce531b9a666ea
Author: Baoquan He <bhe@redhat.com>
Date:   Thu Sep 14 11:31:39 2023 +0800

    x86: kdump: use generic interface to simplify crashkernel reservation code

> 
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for VIDEO_OV2640
>    Depends on [n]: MEDIA_SUPPORT [=m] && VIDEO_DEV [=m] && VIDEO_CAMERA_SENSOR [=n]
>    Selected by [m]:
>    - VIDEO_EM28XX_V4L2 [=m] && USB [=m] && MEDIA_SUPPORT [=m] && MEDIA_USB_SUPPORT [=y] && (MEDIA_CAMERA_SUPPORT [=y] || MEDIA_ANALOG_TV_SUPPORT [=n] || MEDIA_DIGITAL_TV_SUPPORT [=n]) && VIDEO_EM28XX [=m] && MEDIA_SUBDRV_AUTOSELECT [=y] && MEDIA_CAMERA_SUPPORT [=y]
>    WARNING: unmet direct dependencies detected for VIDEO_MT9V011
>    Depends on [n]: MEDIA_SUPPORT [=m] && VIDEO_DEV [=m] && VIDEO_CAMERA_SENSOR [=n]
>    Selected by [m]:
>    - VIDEO_EM28XX_V4L2 [=m] && USB [=m] && MEDIA_SUPPORT [=m] && MEDIA_USB_SUPPORT [=y] && (MEDIA_CAMERA_SUPPORT [=y] || MEDIA_ANALOG_TV_SUPPORT [=n] || MEDIA_DIGITAL_TV_SUPPORT [=n]) && VIDEO_EM28XX [=m] && MEDIA_SUBDRV_AUTOSELECT [=y] && MEDIA_CAMERA_SUPPORT [=y]
> 
> 
> vim +/crash_low_size_default +476 arch/x86/kernel/setup.c
> 
>    472	
>    473	/*
>    474	 * --------- Crashkernel reservation ------------------------------
>    475	 */
>  > 476	unsigned long crash_low_size_default(void)
>    477	{
>    478	#ifdef CONFIG_X86_64
>    479		return max(swiotlb_size_or_default() + (8UL << 20), 256UL << 20);
>    480	#else
>    481		return 0;
>    482	#endif
>    483	}
>    484	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

