Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522AB2E858
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Dec 2023 08:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q9FCpe/4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701939564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NU3/ax4FdONSY+l7rogK89qKXbHKzsxTzWEOVptvPS4=;
	b=Q9FCpe/4KOjYAepWqNVa3pxYZoBNrONkGgcnneUL7e5ycWwr07MUDuqCcdQBJu1RXg8q6p
	PyNK0VeDLjYl2d+PLDAUzBLzr4nYuV7Jo0AQQQKZk4DZnOU1T3bIYL3Ywk4tKfKbT/1GbC
	+WcWHNNtopYhsOE06flr6jpM8AMBGzs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-R_WaoYLyPXCHpWxxWfwb_w-1; Thu, 07 Dec 2023 03:59:21 -0500
X-MC-Unique: R_WaoYLyPXCHpWxxWfwb_w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A074C88B7A0;
	Thu,  7 Dec 2023 08:59:20 +0000 (UTC)
Received: from localhost (unknown [10.72.113.121])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E072A2166B35;
	Thu,  7 Dec 2023 08:59:19 +0000 (UTC)
Date: Thu, 7 Dec 2023 16:59:16 +0800
From: Baoquan He <bhe@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 4353/4884]
 arch/mips/kernel/machine_kexec.c:76:17: error: 'kexec_args' undeclared
Message-ID: <ZXGJZNSfnKJ0rouD@MiWiFi-R3L-srv>
References: <202312061137.QgjJ4nTc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202312061137.QgjJ4nTc-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrew,

On 12/06/23 at 11:17am, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   0f5f12ac05f36f117e793656c3f560625e927f1b
> commit: 4fa0ee5b7e2ddb44036b40795ca4a79d94edc7d4 [4353/4884] kexec_core: change dependency of object files
> config: mips-randconfig-r032-20220731 (https://download.01.org/0day-ci/archive/20231206/202312061137.QgjJ4nTc-lkp@intel.com/config)
> compiler: mipsel-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312061137.QgjJ4nTc-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312061137.QgjJ4nTc-lkp@intel.com/

Could you drop below patch in your akpm-mm/mm-hotfixes-unstable?
commit 6113ecec4da0 ("kexec_core: change dependency of object files")

On next/master, it is:
commit 4fa0ee5b7e2d ("kexec_core: change dependency of object files")

Because the change is incomplete for relevant architectures, then compiling
error can be seen like this LKP report on mips. I have made patches to fix
them completely. Mips building passed with this LKP reproducer.

Thanks
Baoquan


> 
> All errors (new ones prefixed by >>):
> 
>    arch/mips/kernel/machine_kexec.c: In function 'uhi_machine_kexec_prepare':
> >> arch/mips/kernel/machine_kexec.c:76:17: error: 'kexec_args' undeclared (first use in this function)
>       76 |                 kexec_args[0] = -2;
>          |                 ^~~~~~~~~~
>    arch/mips/kernel/machine_kexec.c:76:17: note: each undeclared identifier is reported only once for each function it appears in
>    arch/mips/kernel/machine_kexec.c: In function 'machine_kexec_prepare':
>    arch/mips/kernel/machine_kexec.c:97:14: error: implicit declaration of function 'kexec_nonboot_cpu_func' [-Werror=implicit-function-declaration]
>       97 |         if (!kexec_nonboot_cpu_func())
>          |              ^~~~~~~~~~~~~~~~~~~~~~
>    arch/mips/kernel/machine_kexec.c: In function 'kexec_shutdown_secondary':
>    arch/mips/kernel/machine_kexec.c:129:9: error: implicit declaration of function 'kexec_reboot' [-Werror=implicit-function-declaration]
>      129 |         kexec_reboot();
>          |         ^~~~~~~~~~~~
>    arch/mips/kernel/machine_kexec.c: At top level:
>    arch/mips/kernel/machine_kexec.c:136:1: warning: no previous prototype for 'machine_shutdown' [-Wmissing-prototypes]
>      136 | machine_shutdown(void)
>          | ^~~~~~~~~~~~~~~~
>    arch/mips/kernel/machine_kexec.c:152:1: warning: no previous prototype for 'machine_crash_shutdown' [-Wmissing-prototypes]
>      152 | machine_crash_shutdown(struct pt_regs *regs)
>          | ^~~~~~~~~~~~~~~~~~~~~~
>    arch/mips/kernel/machine_kexec.c: In function 'machine_crash_shutdown':
>    arch/mips/kernel/machine_kexec.c:157:17: error: implicit declaration of function 'default_machine_crash_shutdown'; did you mean '_machine_crash_shutdown'? [-Werror=implicit-function-declaration]
>      157 |                 default_machine_crash_shutdown(regs);
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>          |                 _machine_crash_shutdown
>    arch/mips/kernel/machine_kexec.c: At top level:
>    arch/mips/kernel/machine_kexec.c:161:6: warning: no previous prototype for 'kexec_nonboot_cpu_jump' [-Wmissing-prototypes]
>      161 | void kexec_nonboot_cpu_jump(void)
>          |      ^~~~~~~~~~~~~~~~~~~~~~
>    arch/mips/kernel/machine_kexec.c:170:6: warning: no previous prototype for 'kexec_reboot' [-Wmissing-prototypes]
>      170 | void kexec_reboot(void)
>          |      ^~~~~~~~~~~~
>    arch/mips/kernel/machine_kexec.c:170:6: warning: conflicting types for 'kexec_reboot'; have 'void(void)'
>    arch/mips/kernel/machine_kexec.c:129:9: note: previous implicit declaration of 'kexec_reboot' with type 'void(void)'
>      129 |         kexec_reboot();
>          |         ^~~~~~~~~~~~
>    arch/mips/kernel/machine_kexec.c: In function 'kexec_reboot':
>    arch/mips/kernel/machine_kexec.c:191:17: error: implicit declaration of function 'kexec_nonboot_cpu'; did you mean 'kexec_nonboot_cpu_jump'? [-Werror=implicit-function-declaration]
>      191 |                 kexec_nonboot_cpu();
>          |                 ^~~~~~~~~~~~~~~~~
>          |                 kexec_nonboot_cpu_jump
>    arch/mips/kernel/machine_kexec.c: In function 'machine_kexec':
>    arch/mips/kernel/machine_kexec.c:259:26: error: 'kexec_smp_wait' undeclared (first use in this function)
>      259 |                 (void *)(kexec_smp_wait - relocate_new_kernel);
>          |                          ^~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors
> 
> 
> vim +/kexec_args +76 arch/mips/kernel/machine_kexec.c
> 
> 2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  54  
> 2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  55  static int uhi_machine_kexec_prepare(struct kimage *kimage)
> 2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  56  {
> 2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  57  	int i;
> 2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  58  
> 2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  59  	/*
> 2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  60  	 * In case DTB file is not passed to the new kernel, a flat device
> 2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  61  	 * tree will be created by kexec tool. It holds modified command
> 2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  62  	 * line for the new kernel.
> 2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  63  	 */
> 2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  64  	for (i = 0; i < kimage->nr_segments; i++) {
> 2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  65  		struct fdt_header fdt;
> 2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  66  
> 2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  67  		if (kimage->segment[i].memsz <= sizeof(fdt))
> 2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  68  			continue;
> 2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  69  
> 2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  70  		if (copy_from_user(&fdt, kimage->segment[i].buf, sizeof(fdt)))
> 2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  71  			continue;
> 2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  72  
> 2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  73  		if (fdt_check_header(&fdt))
> 2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  74  			continue;
> 2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  75  
> 2fe8ea39c9a848 Dengcheng Zhu 2018-09-11 @76  		kexec_args[0] = -2;
> 2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  77  		kexec_args[1] = (unsigned long)
> 2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  78  			phys_to_virt((unsigned long)kimage->segment[i].mem);
> 2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  79  		break;
> 2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  80  	}
> 2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  81  
> 2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  82  	return 0;
> 2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  83  }
> 2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  84  
> 
> :::::: The code at line 76 was first introduced by commit
> :::::: 2fe8ea39c9a8489799cf86bb377fc80492b5b3bf MIPS: kexec: Use prepare method from Generic for UHI platforms
> 
> :::::: TO: Dengcheng Zhu <dzhu@wavecomp.com>
> :::::: CC: Paul Burton <paul.burton@mips.com>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

