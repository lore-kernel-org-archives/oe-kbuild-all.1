Received: from forward501b.mail.yandex.net (forward501b.mail.yandex.net [178.154.239.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11A5156E4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Nov 2023 11:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="nv7qgcpJ"
Received: from mail-nwsmtp-smtp-production-main-22.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-22.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:3995:0:640:f3e3:0])
	by forward501b.mail.yandex.net (Yandex) with ESMTP id 5ED9A60AA7;
	Wed, 15 Nov 2023 14:16:45 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-22.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id iGiM3hKUu0U0-kf0t2dEG;
	Wed, 15 Nov 2023 14:16:44 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1700047004; bh=RBcP8zu1Sa2fFdHa0m2F2g64VviwJuhDnJGYcTjGY00=;
	h=In-Reply-To:Subject:To:From:Cc:Date:References:Message-ID;
	b=nv7qgcpJlCh/1i2oPd3bVGtzsNxb6KvEZwXmd99b6UF7XSqx8CMbBEiWJpaqeOGgE
	 fKEK3QUWhpMeslJhBwJYhN8XELqh6n1WZq1umeBsf7Q6LEaOlcbNqSdRSW0JKLXs/c
	 doQxcT0T5Mr2SfkGhet9fZ8gfjMbDLt4Mm7yxCdU=
Authentication-Results: mail-nwsmtp-smtp-production-main-22.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
Message-ID: <2e548eae-f851-44ce-b0e5-963bc5f47e35@yandex.ru>
Date: Wed, 15 Nov 2023 14:16:43 +0300
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: oe-kbuild-all@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, Kalle Valo <quic_kvalo@quicinc.com>
References: <202311150821.cI4yciFE-lkp@intel.com>
Content-Language: en-US
From: Dmitry Antipov <dmantipov@yandex.ru>
Autocrypt: addr=dmantipov@yandex.ru; keydata=
 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
 tx98MCutXbJWn55RtnVKbpIiMfBrcB8=
Subject: GCC/ARM experts wanted [Was: Re:
 include/linux/compiler_types.h:397:45: error: call to
 '__compiletime_assert_460' declared with attribute error: BUILD_BUG_ON
 failed: sizeof(vring->va[0]) != 32]
In-Reply-To: <202311150821.cI4yciFE-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/23 03:49, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   9bacdd8996c77c42ca004440be610692275ff9d0
> commit: 1ad8237e971630c66a1a6194491e0837b64d00e0 wifi: wil6210: fix fortify warnings
> date:   4 months ago
> config: arm-buildonly-randconfig-r003-20220914 (https://download.01.org/0day-ci/archive/20231115/202311150821.cI4yciFE-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231115/202311150821.cI4yciFE-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311150821.cI4yciFE-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     In file included from <command-line>:
>     drivers/net/wireless/ath/wil6210/txrx.c: In function 'wil_vring_alloc':
>>> include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_460' declared with attribute error: BUILD_BUG_ON failed: sizeof(vring->va[0]) != 32
>       397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>           |                                             ^
>     include/linux/compiler_types.h:378:25: note: in definition of macro '__compiletime_assert'
>       378 |                         prefix ## suffix();                             \
>           |                         ^~~~~~
>     include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
>       397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>           |         ^~~~~~~~~~~~~~~~~~~
>     include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
>        39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>           |                                     ^~~~~~~~~~~~~~~~~~
>     include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>        50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
>           |         ^~~~~~~~~~~~~~~~
>     drivers/net/wireless/ath/wil6210/txrx.c:118:9: note: in expansion of macro 'BUILD_BUG_ON'
>       118 |         BUILD_BUG_ON(sizeof(vring->va[0]) != 32);
>           |         ^~~~~~~~~~~~
> --
>     In file included from <command-line>:
>     drivers/net/wireless/ath/wil6210/txrx_edma.c: In function 'wil_ring_alloc_desc_ring':
>>> include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_452' declared with attribute error: BUILD_BUG_ON failed: sizeof(ring->va[0]) != 32
>       397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>           |                                             ^
>     include/linux/compiler_types.h:378:25: note: in definition of macro '__compiletime_assert'
>       378 |                         prefix ## suffix();                             \
>           |                         ^~~~~~
>     include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
>       397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>           |         ^~~~~~~~~~~~~~~~~~~
>     include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
>        39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>           |                                     ^~~~~~~~~~~~~~~~~~
>     include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>        50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
>           |         ^~~~~~~~~~~~~~~~
>     drivers/net/wireless/ath/wil6210/txrx_edma.c:381:9: note: in expansion of macro 'BUILD_BUG_ON'
>       381 |         BUILD_BUG_ON(sizeof(ring->va[0]) != 32);
>           |         ^~~~~~~~~~~~
> 
> 
> vim +/__compiletime_assert_460 +397 include/linux/compiler_types.h
> 
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  383
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  384  #define _compiletime_assert(condition, msg, prefix, suffix) \
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  385  	__compiletime_assert(condition, msg, prefix, suffix)
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  386
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  387  /**
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  388   * compiletime_assert - break build and emit msg if condition is false
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  389   * @condition: a compile-time constant condition to check
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  390   * @msg:       a message to emit if condition is false
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  391   *
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  392   * In tradition of POSIX assert, this macro will break the build if the
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  393   * supplied condition is *false*, emitting the supplied error message if the
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  394   * compiler has support to do so.
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  395   */
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  396  #define compiletime_assert(condition, msg) \
> eb5c2d4b45e3d2 Will Deacon 2020-07-21 @397  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  398
> 
> :::::: The code at line 397 was first introduced by commit
> :::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h
> 
> :::::: TO: Will Deacon <will@kernel.org>
> :::::: CC: Will Deacon <will@kernel.org>

I've tracked this down to the following sample:

struct vring_tx_mac {
	unsigned int d[3];
	unsigned int ucode_cmd;
} __attribute__((packed));

struct vring_rx_mac {
	unsigned int d0;
	unsigned int d1;
	unsigned short w4;
	union { struct { unsigned short pn_15_0; unsigned int pn_47_16; } __attribute__((__packed__));
		struct { unsigned short pn_15_0; unsigned int pn_47_16; } __attribute__((__packed__)) pn;
	};
} __attribute__((packed));

struct wil_ring_dma_addr {
	unsigned int addr_low;
	unsigned short addr_high;
} __attribute__((packed));

struct vring_tx_dma {
	unsigned int d0;
	struct wil_ring_dma_addr addr;
	unsigned char  ip_length;
	unsigned char  b11;       /* 0..6: mac_length; 7:ip_version */
	unsigned char  error;     /* 0..2: err; 3..7: reserved; */
	unsigned char  status;    /* 0: used; 1..7; reserved */
	unsigned short length;
} __packed;

struct vring_tx_desc {
	struct vring_tx_mac mac;
	struct vring_tx_dma dma;
} __attribute__((packed));

struct wil_ring_tx_enhanced_mac {
	unsigned int d[3];
	unsigned short tso_mss;
	unsigned short scratchpad;
} __attribute__((packed));

struct wil_ring_tx_enhanced_dma {
	unsigned char l4_hdr_len;
	unsigned char cmd;
	unsigned short w1;
	struct wil_ring_dma_addr addr;
	unsigned char  ip_length;
	unsigned char  b11;       /* 0..6: mac_length; 7:ip_version */
	unsigned short addr_high_high;
	unsigned short length;
} __attribute__((packed));

struct wil_tx_enhanced_desc {
	struct wil_ring_tx_enhanced_mac mac;
	struct wil_ring_tx_enhanced_dma dma;
} __attribute__((packed));

union wil_tx_desc {
	struct vring_tx_desc legacy;
	struct wil_tx_enhanced_desc enhanced;
} __attribute__((packed));

struct vring_rx_dma {
	unsigned int d0;
	struct wil_ring_dma_addr addr;
	unsigned char  ip_length;
	unsigned char  b11;
	unsigned char  error;
	unsigned char  status;
	unsigned short length;
} __attribute__((packed));

struct vring_rx_desc {
	struct vring_rx_mac mac;
	struct vring_rx_dma dma;
} __attribute__((packed));

struct wil_ring_rx_enhanced_mac {
	unsigned int d[3];
	unsigned short buff_id;
	unsigned short reserved;
} __attribute((packed));

struct wil_ring_rx_enhanced_dma {
	unsigned int d0;
	struct wil_ring_dma_addr addr;
	unsigned short w5;
	unsigned short addr_high_high;
	unsigned short length;
} __attribute((packed));

struct wil_rx_enhanced_desc {
	struct wil_ring_rx_enhanced_mac mac;
	struct wil_ring_rx_enhanced_dma dma;
} __attribute((packed));

union wil_rx_desc {
	struct vring_rx_desc legacy;
	struct wil_rx_enhanced_desc enhanced;
} __attribute__((packed));

union wil_ring_desc {
	union wil_tx_desc tx;
	union wil_rx_desc rx;
} __attribute__((packed));

int f (void) {
	return sizeof(union wil_ring_desc);
}

$ arm-linux-gnu-gcc -Os -c t-build-bug.c
$ arm-linux-gnu-objdump  -j .text -D t-build-bug.o

t-build-bug.o:     file format elf32-littlearm

Disassembly of section .text:

00000000 <f>:
    0:	e3a00020 	mov	r0, #32                         ;; OK
    4:	e12fff1e 	bx	lr

$ arm-linux-gnu-gcc -mlittle-endian -std=gnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -fno-dwarf2-cfi-asm -mno-fdpic -fno-omit-frame-pointer -mapcs -mno-sched-prolog 
-fno-ipa-sra -mabi=apcs-gnu -mno-thumb-interwork -marm -Wa,-mno-warn-deprecated -march=armv4 -mtune=xscale -msoft-float -Uarm -fno-delete-null-pointer-checks -Os -fno-allow-store-data-races 
-fno-reorder-blocks -fno-ipa-cp-clone -fno-partial-inlining -fno-stack-protector -fno-omit-frame-pointer -fno-optimize-sibling-calls -ftrivial-auto-var-init=zero -fno-stack-clash-protection -pg 
-fno-inline-functions-called-once -fstrict-flex-arrays=3 -fno-strict-overflow -fno-stack-check -fconserve-stack -fsanitize=kernel-address -fasan-shadow-offset=0x1f000000 --param asan-globals=1 --param 
asan-instrumentation-with-call-threshold=10000 --param asan-instrument-allocas=1 --param asan-stack=1 --param asan-kernel-mem-intrinsic-prefix=1 -c t-build-bug.c
$ arm-linux-gnu-objdump  -j .text -D t-build-bug.o

t-build-bug.o:     file format elf32-littlearm

Disassembly of section .text:

00000000 <f>:
    0:	e1a0c00d 	mov	ip, sp
    4:	e92dd800 	push	{fp, ip, lr, pc}
    8:	e24cb004 	sub	fp, ip, #4
    c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
   10:	ebfffffe 	bl	0 <__gnu_mcount_nc>
   14:	e3a00022 	mov	r0, #34	@ 0x22                  ;; OOPS
   18:	e89da800 	ldm	sp, {fp, sp, pc}

Now it's time for advice from GCC/ARM experts.

Dmitry
