Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A37344047
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Oct 2025 17:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761671470; cv=none; b=A2nZa7ZZSW7W5oRCMbCSQSpiISUlRoNgG5ln2xvKhsSXQ9Y81/wBCnToYkqWqR0bX5Ff+oe4peoRcTp2xaBEDRH4F9BGRXmXP5Z7x1o94CAmt1ZOLnaGjAx33QKkZvNN7+F7zutYQsmcz5zKB7etNEzQe8K5xv6y73w4vH88YWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761671470; c=relaxed/simple;
	bh=1vhKrd3/RWLiHndXUNiqDow/k7vX5nk1FxHFYTfDRmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=geUdUjACp75M9+cOvfwDI1upF+nky7uxLmrZXOdQb3IG0cmggzf/pXPDcp1otgEIEn6aqFangxrXOOf9ta4jcHPQhRIlM5XWPW5EYK78jJW6iBieHD7uT1UD8Usiu93XIZVWAUVJ4PuTCueMbG81NDi7oDztnDMyfZ8/cYD0tn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0ZVieBQc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Uifjez09; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0ZVieBQc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Uifjez09; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0ZVieBQc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Uifjez09";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0ZVieBQc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Uifjez09"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 120A11F460;
	Tue, 28 Oct 2025 17:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761671466; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=bFzcLHgriqOOOUuyd7JqgEEIywVC2+E29H9J7ANeYfM=;
	b=0ZVieBQc675uk1/PIPfkSn859BStoZEf/rkOYQFd8Giby5fM3FDUgyS/lesvQKwtRYZJcE
	njQE9CFTlgjy0tkVO4704hJWuRqzk6IliTwypWrnzq5wIOn7tB4kLVYPfoW6NDrkMx8cmw
	Bi4SwD/qCL4qUiEvCGNoB7qqRCS4Yc0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761671466;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=bFzcLHgriqOOOUuyd7JqgEEIywVC2+E29H9J7ANeYfM=;
	b=Uifjez093W1hsCrXgI7bZPL75k+zQiysjN+9goeilzeOsIhfgsUhtr4FUsUtCIfyY1uOUQ
	JDo9zViaJm8+IIBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0ZVieBQc;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Uifjez09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761671466; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=bFzcLHgriqOOOUuyd7JqgEEIywVC2+E29H9J7ANeYfM=;
	b=0ZVieBQc675uk1/PIPfkSn859BStoZEf/rkOYQFd8Giby5fM3FDUgyS/lesvQKwtRYZJcE
	njQE9CFTlgjy0tkVO4704hJWuRqzk6IliTwypWrnzq5wIOn7tB4kLVYPfoW6NDrkMx8cmw
	Bi4SwD/qCL4qUiEvCGNoB7qqRCS4Yc0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761671466;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=bFzcLHgriqOOOUuyd7JqgEEIywVC2+E29H9J7ANeYfM=;
	b=Uifjez093W1hsCrXgI7bZPL75k+zQiysjN+9goeilzeOsIhfgsUhtr4FUsUtCIfyY1uOUQ
	JDo9zViaJm8+IIBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D1FF013693;
	Tue, 28 Oct 2025 17:11:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fWWVMSn5AGljZwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 28 Oct 2025 17:11:05 +0000
Message-ID: <655f56d2-480e-4304-b54d-f6963bbb4fce@suse.de>
Date: Tue, 28 Oct 2025 18:11:01 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 3294/4391]
 arch/sh/include/cpu-sh3/cpu/dac.h:21:13: error: implicit declaration of
 function '__raw_readb'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
 "Daniel Thompson (RISCstar)" <danielt@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <202510282206.wI0HrqcK-lkp@intel.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <202510282206.wI0HrqcK-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 120A11F460
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -4.51

Hi,

a possible fix is at 
https://lore.kernel.org/dri-devel/20251028170913.16711-1-tzimmermann@suse.de/

Best regards
Thomas

Am 28.10.25 um 15:22 schrieb kernel test robot:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   f7d2388eeec24966fc4d5cf32d706f0514f29ac5
> commit: 243ce64b2b371cdf2cbc39c9422cb3047cab6de7 [3294/4391] backlight: Do not include <linux/fb.h> in header file
> config: sh-randconfig-r072-20251028 (https://download.01.org/0day-ci/archive/20251028/202510282206.wI0HrqcK-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510282206.wI0HrqcK-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510282206.wI0HrqcK-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>     In file included from drivers/video/backlight/hp680_bl.c:20:
>     arch/sh/include/cpu-sh3/cpu/dac.h: In function 'sh_dac_enable':
>>> arch/sh/include/cpu-sh3/cpu/dac.h:21:13: error: implicit declaration of function '__raw_readb' [-Wimplicit-function-declaration]
>        21 |         v = __raw_readb(DACR);
>           |             ^~~~~~~~~~~
>>> arch/sh/include/cpu-sh3/cpu/dac.h:24:9: error: implicit declaration of function '__raw_writeb'; did you mean '__raw_write_lock'? [-Wimplicit-function-declaration]
>        24 |         __raw_writeb(v,DACR);
>           |         ^~~~~~~~~~~~
>           |         __raw_write_lock
>
> Kconfig warnings: (for reference only)
>     WARNING: unmet direct dependencies detected for OF_GPIO
>     Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
>     Selected by [y]:
>     - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])
>     WARNING: unmet direct dependencies detected for GPIO_SYSCON
>     Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
>     Selected by [m]:
>     - GPIO_SAMA5D2_PIOBU [=m] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF_GPIO [=y] && (ARCH_AT91 || COMPILE_TEST [=y])
>     WARNING: unmet direct dependencies detected for I2C_K1
>     Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
>     Selected by [y]:
>     - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]
>
>
> vim +/__raw_readb +21 arch/sh/include/cpu-sh3/cpu/dac.h
>
> ^1da177e4c3f41 include/asm-sh/cpu-sh3/dac.h      Linus Torvalds 2005-04-16  16
> ^1da177e4c3f41 include/asm-sh/cpu-sh3/dac.h      Linus Torvalds 2005-04-16  17
> ^1da177e4c3f41 include/asm-sh/cpu-sh3/dac.h      Linus Torvalds 2005-04-16  18  static __inline__ void sh_dac_enable(int channel)
> ^1da177e4c3f41 include/asm-sh/cpu-sh3/dac.h      Linus Torvalds 2005-04-16  19  {
> ^1da177e4c3f41 include/asm-sh/cpu-sh3/dac.h      Linus Torvalds 2005-04-16  20  	unsigned char v;
> 9d56dd3b083a3b arch/sh/include/cpu-sh3/cpu/dac.h Paul Mundt     2010-01-26 @21  	v = __raw_readb(DACR);
> ^1da177e4c3f41 include/asm-sh/cpu-sh3/dac.h      Linus Torvalds 2005-04-16  22  	if(channel) v |= DACR_DAOE1;
> ^1da177e4c3f41 include/asm-sh/cpu-sh3/dac.h      Linus Torvalds 2005-04-16  23  	else v |= DACR_DAOE0;
> 9d56dd3b083a3b arch/sh/include/cpu-sh3/cpu/dac.h Paul Mundt     2010-01-26 @24  	__raw_writeb(v,DACR);
> ^1da177e4c3f41 include/asm-sh/cpu-sh3/dac.h      Linus Torvalds 2005-04-16  25  }
> ^1da177e4c3f41 include/asm-sh/cpu-sh3/dac.h      Linus Torvalds 2005-04-16  26
>
> :::::: The code at line 21 was first introduced by commit
> :::::: 9d56dd3b083a3bec56e9da35ce07baca81030b03 sh: Mass ctrl_in/outX to __raw_read/writeX conversion.
>
> :::::: TO: Paul Mundt <lethal@linux-sh.org>
> :::::: CC: Paul Mundt <lethal@linux-sh.org>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


