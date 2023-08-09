Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BC5181
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 02:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=C8AM83AJANNuX0lxbhW8Ztrw2QWS+Gwe3N8mtrtsoqY=; b=NXAkaXre7x3g1WzzB2zEiLmZXT
	3kIPUY8Bqurq/tR5Z21CTPFfXUx98u8pHnq37Jm/6wZVkLCksiuatfylt7616pmPlcRJIC39KPwCH
	gkhwYuyQLvzUxVpf9XhwhV9x0MFyM/2/NgMjE1Xvqsv2JfQPAB2j/rA//06pVcBVmyEkctw8vYIrP
	Yd2NcYSV6T9xyiKtSSoxTZNYZVYVykorAve/1n7CSt4a6B2EauXb8izt0Tt5wYTKvGAsF6TDkN73a
	ltMhu/rk9FPiB+5gv39Ved30H77lcNAhKLUhpXvJcKY6ovCThU6Wpg3lFxtosYSYQZ1fM3rWsfvwC
	FyHMqktQ==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qTZ0t-003tpC-31;
	Wed, 09 Aug 2023 02:33:31 +0000
Message-ID: <d01c0944-0053-f837-3c09-e9184576d428@infradead.org>
Date: Tue, 8 Aug 2023 19:33:30 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [stable:linux-5.15.y 22/9999] undefined reference to
 `fb_set_suspend'
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Sasha Levin <sashal@kernel.org>
References: <202308090617.oE1jig9b-lkp@intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <202308090617.oE1jig9b-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello robot,

On 8/8/23 15:40, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
> head:   c275eaaaa34260e6c907bc5e7ee07c096bc45064
> commit: ea2258664ffcde0d5c6836e70e685696f35af75a [22/9999] m68k: coldfire/device.c: only build for MCF_EDMA when h/w macros are defined

Did you settle on that commit by using git bisection?
If so, it surely went wrong somewhere.

That patch has absolutely nothing to do with DRM or FB.
If I apply that patch in reverse to 5.15.125, the build errors still happen.

There have been a bunch of changes to drivers/gpu/drm/Kconfig since 5.15 days.
Some of them are apparently needed here.

cheers.

> config: m68k-randconfig-r006-20230808 (https://download.01.org/0day-ci/archive/20230809/202308090617.oE1jig9b-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230809/202308090617.oE1jig9b-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308090617.oE1jig9b-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    m68k-linux-ld: warning: arch/m68k/lib/umodsi3.o: missing .note.GNU-stack section implies executable stack
>    m68k-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
>    m68k-linux-ld: warning: arch/m68k/lib/umodsi3.o: missing .note.GNU-stack section implies executable stack
>    m68k-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
>    m68k-linux-ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
>    m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_set_suspend':
>>> (.text+0x2b0): undefined reference to `fb_set_suspend'
>    m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_resume_worker':
>    drm_fb_helper.c:(.text+0x2d0): undefined reference to `fb_set_suspend'
>    m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_unregister_fbi':
>>> (.text+0x344): undefined reference to `unregister_framebuffer'
>    m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_fini':
>>> (.text+0x39a): undefined reference to `fb_dealloc_cmap'
>>> m68k-linux-ld: (.text+0x3a4): undefined reference to `framebuffer_release'
>    m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_read':
>>> (.text+0x458): undefined reference to `fb_sys_read'
>    m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_alloc_fbi':
>>> (.text+0xec2): undefined reference to `framebuffer_alloc'
>>> m68k-linux-ld: (.text+0xee0): undefined reference to `fb_alloc_cmap'
>>> m68k-linux-ld: (.text+0xf14): undefined reference to `fb_dealloc_cmap'
>    m68k-linux-ld: (.text+0xf3c): undefined reference to `framebuffer_release'
>    m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_generic_probe':
>    drm_fb_helper.c:(.text+0x109c): undefined reference to `fb_deferred_io_init'
>    m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `__drm_fb_helper_initial_config_and_unlock':
>    drm_fb_helper.c:(.text+0x115c): undefined reference to `register_framebuffer'
>    m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_set_suspend_unlocked':
>    (.text+0x1b30): undefined reference to `fb_set_suspend'
>    m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_write':
>>> (.text+0x211a): undefined reference to `fb_sys_write'
>    m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_fillrect':
>>> (.text+0x2162): undefined reference to `sys_fillrect'
>    m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_copyarea':
>>> (.text+0x21a0): undefined reference to `sys_copyarea'
>    m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_imageblit':
>>> (.text+0x21de): undefined reference to `sys_imageblit'
>    m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_cfb_fillrect':
>>> (.text+0x221c): undefined reference to `cfb_fillrect'
>    m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_cfb_copyarea':
>>> (.text+0x225a): undefined reference to `cfb_copyarea'
>    m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_cfb_imageblit':
>>> (.text+0x2298): undefined reference to `cfb_imageblit'
>    m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fbdev_fb_fillrect':
>    drm_fb_helper.c:(.text+0x2404): undefined reference to `cfb_fillrect'
>>> m68k-linux-ld: drm_fb_helper.c:(.text+0x2410): undefined reference to `sys_fillrect'
>    m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fbdev_fb_imageblit':
>    drm_fb_helper.c:(.text+0x245a): undefined reference to `cfb_imageblit'
>>> m68k-linux-ld: drm_fb_helper.c:(.text+0x2466): undefined reference to `sys_imageblit'
>    m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fbdev_fb_copyarea':
>    drm_fb_helper.c:(.text+0x24b0): undefined reference to `cfb_copyarea'
>>> m68k-linux-ld: drm_fb_helper.c:(.text+0x24bc): undefined reference to `sys_copyarea'
>    m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fbdev_cleanup':
>    drm_fb_helper.c:(.text+0x26e2): undefined reference to `fb_deferred_io_cleanup'
>    m68k-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fbdev_client_unregister':
>    drm_fb_helper.c:(.text+0x2772): undefined reference to `unregister_framebuffer'
> 

-- 
~Randy
