Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308361E3DCF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 10:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736244120; cv=none; b=ReUnGQtHdtVov8IDBrJjeD8HFICpWSkDb/Fil55RX88ZNN8RdmbeWxbZ4wvpxvofkqrbVfCusZJy+T+X+LdebTbVAx29kW/ZnQC89iIB4Er1Yr9j7848BvzTLRY/uQ0ZY+SCPqU3T0zo++TLGwhLRzdQ15D/jNR4/ooJhlj3XJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736244120; c=relaxed/simple;
	bh=z1hErruozGeOHy8jAGVp/IFrAQGn83dz/fqg2LEpaa8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ca+Q+EpzTY3wuaMM9k9F3CHiVaSxixQKwVYfjAPizvC3ePFr9DL0uyCfK4JNchzCvqybz+T2vHrVGMXxhl8nr58YUPUrxN16kT/Gp0HVUp2TnVyOkK3lbvrWHRxIHin641h0dkwRso9S/D1+FOdXjX2G7R0dVmnGjvBdK68RiLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uhaaFpoj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KUNPl1ov; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uqg87+6E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YKOn01ni; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uhaaFpoj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KUNPl1ov";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uqg87+6E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YKOn01ni"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4C9181F451;
	Tue,  7 Jan 2025 10:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736244114; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7H7INNjEL5Na8lJvQ3/FP+eLSbfj2g5X5d9YbALU7qQ=;
	b=uhaaFpoj3wkH92hYWMofBrft4krYyaVJ/lKf+hJpiIB7u7pLKuigDUpuWdOhNxP6N1d+eO
	RwUUEgSDNuv0dNyurgiopOODpR8GunjAwtKpHFylzrkzWp1ZgY6n2t12rRlzGJdd8EsIXE
	A3iI75f/a0MYdKHBBChm5L20QU2MctY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736244114;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7H7INNjEL5Na8lJvQ3/FP+eLSbfj2g5X5d9YbALU7qQ=;
	b=KUNPl1ovd35fs8Z3PiA2UpbPIgug14YohBeRSvSYAnPk7xaqFfu3MWBqaqDsFV6z7Z9usW
	EC5z3Rswk2RPMBCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736244112; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7H7INNjEL5Na8lJvQ3/FP+eLSbfj2g5X5d9YbALU7qQ=;
	b=uqg87+6EUo8zpK8Ku9OTLKfpt9UMh0NF0dj/9lKRkCE7QJjqLpYkOVUD+tNhbur/9JzXoK
	7BHrLgNfuiwBOTeTqQDhPMZsHQ24ULbY8ra0iT6/3FP+S+0AxDzGFuBbHA5WxVu4sMEv5p
	rXGXbJ0DFkSO4YB2eYijOOtIsz+385A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736244112;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7H7INNjEL5Na8lJvQ3/FP+eLSbfj2g5X5d9YbALU7qQ=;
	b=YKOn01ni2khzs4IQskIVN8Bl60cyDUB40UboHREJjCySoTBXUzowBXCp6ZLBusWP91CXyf
	i+RKOycL16JrywAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 20A1C13A6A;
	Tue,  7 Jan 2025 10:01:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Hp6rBpD7fGfDXAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 07 Jan 2025 10:01:52 +0000
Message-ID: <8ae05080-4d9f-49eb-94f1-e2868ad6dd33@suse.de>
Date: Tue, 7 Jan 2025 11:01:51 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: arch/m68k/include/asm/raw_io.h:39: warning: "__raw_readb"
 redefined
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>
References: <202501071629.DNEswlm8-lkp@intel.com>
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
In-Reply-To: <202501071629.DNEswlm8-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.org.uk:email,suse.de:mid,01.org:url,imap1.dmz-prg2.suse.org:helo,linux-foundation.org:email,intel.com:email]
X-Spam-Flag: NO
X-Spam-Level: 

See 
https://lore.kernel.org/lkml/20250107095912.130530-1-tzimmermann@suse.de/T/#u 
for a possible fix.


Am 07.01.25 um 09:57 schrieb kernel test robot:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   fbfd64d25c7af3b8695201ebc85efe90be28c5a3
> commit: 7283f862bd991c8657e9bf1c02db772fcf018f13 drm: Implement DRM aperture helpers under video/
> date:   2 years, 6 months ago
> config: m68k-randconfig-m031-20211009 (https://download.01.org/0day-ci/archive/20250107/202501071629.DNEswlm8-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 12.4.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501071629.DNEswlm8-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501071629.DNEswlm8-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>     In file included from arch/m68k/include/asm/vga.h:12,
>                      from include/video/vga.h:22,
>                      from include/linux/vgaarb.h:34,
>                      from drivers/video/aperture.c:12:
>>> arch/m68k/include/asm/raw_io.h:39: warning: "__raw_readb" redefined
>        39 | #define __raw_readb in_8
>           |
>     In file included from arch/m68k/include/asm/io.h:6,
>                      from include/linux/io.h:13,
>                      from include/linux/irq.h:20,
>                      from include/asm-generic/hardirq.h:17,
>                      from ./arch/m68k/include/generated/asm/hardirq.h:1,
>                      from include/linux/hardirq.h:11,
>                      from include/linux/interrupt.h:11,
>                      from include/linux/trace_recursion.h:5,
>                      from include/linux/ftrace.h:10,
>                      from include/linux/kprobes.h:28,
>                      from include/linux/kgdb.h:19,
>                      from include/linux/fb.h:6,
>                      from drivers/video/aperture.c:5:
>     arch/m68k/include/asm/io_no.h:16: note: this is the location of the previous definition
>        16 | #define __raw_readb(addr) \
>           |
>>> arch/m68k/include/asm/raw_io.h:40: warning: "__raw_readw" redefined
>        40 | #define __raw_readw in_be16
>           |
>     arch/m68k/include/asm/io_no.h:18: note: this is the location of the previous definition
>        18 | #define __raw_readw(addr) \
>           |
>>> arch/m68k/include/asm/raw_io.h:41: warning: "__raw_readl" redefined
>        41 | #define __raw_readl in_be32
>           |
>     arch/m68k/include/asm/io_no.h:20: note: this is the location of the previous definition
>        20 | #define __raw_readl(addr) \
>           |
>>> arch/m68k/include/asm/raw_io.h:46: warning: "__raw_writeb" redefined
>        46 | #define __raw_writeb(val,addr) out_8((addr),(val))
>           |
>     arch/m68k/include/asm/io_no.h:23: note: this is the location of the previous definition
>        23 | #define __raw_writeb(b, addr) (void)((*(__force volatile u8 *) (addr)) = (b))
>           |
>>> arch/m68k/include/asm/raw_io.h:47: warning: "__raw_writew" redefined
>        47 | #define __raw_writew(val,addr) out_be16((addr),(val))
>           |
>     arch/m68k/include/asm/io_no.h:24: note: this is the location of the previous definition
>        24 | #define __raw_writew(b, addr) (void)((*(__force volatile u16 *) (addr)) = (b))
>           |
>>> arch/m68k/include/asm/raw_io.h:48: warning: "__raw_writel" redefined
>        48 | #define __raw_writel(val,addr) out_be32((addr),(val))
>           |
>     arch/m68k/include/asm/io_no.h:25: note: this is the location of the previous definition
>        25 | #define __raw_writel(b, addr) (void)((*(__force volatile u32 *) (addr)) = (b))
>           |
>
>
> vim +/__raw_readb +39 arch/m68k/include/asm/raw_io.h
>
> ^1da177e4c3f41 include/asm-m68k/raw_io.h Linus Torvalds 2005-04-16  35
> ^1da177e4c3f41 include/asm-m68k/raw_io.h Linus Torvalds 2005-04-16  36  #define raw_inb in_8
> ^1da177e4c3f41 include/asm-m68k/raw_io.h Linus Torvalds 2005-04-16  37  #define raw_inw in_be16
> ^1da177e4c3f41 include/asm-m68k/raw_io.h Linus Torvalds 2005-04-16  38  #define raw_inl in_be32
> f9569e1d154079 include/asm-m68k/raw_io.h Al Viro        2007-07-20 @39  #define __raw_readb in_8
> f9569e1d154079 include/asm-m68k/raw_io.h Al Viro        2007-07-20 @40  #define __raw_readw in_be16
> f9569e1d154079 include/asm-m68k/raw_io.h Al Viro        2007-07-20 @41  #define __raw_readl in_be32
> ^1da177e4c3f41 include/asm-m68k/raw_io.h Linus Torvalds 2005-04-16  42
> ^1da177e4c3f41 include/asm-m68k/raw_io.h Linus Torvalds 2005-04-16  43  #define raw_outb(val,port) out_8((port),(val))
> ^1da177e4c3f41 include/asm-m68k/raw_io.h Linus Torvalds 2005-04-16  44  #define raw_outw(val,port) out_be16((port),(val))
> ^1da177e4c3f41 include/asm-m68k/raw_io.h Linus Torvalds 2005-04-16  45  #define raw_outl(val,port) out_be32((port),(val))
> f9569e1d154079 include/asm-m68k/raw_io.h Al Viro        2007-07-20 @46  #define __raw_writeb(val,addr) out_8((addr),(val))
> f9569e1d154079 include/asm-m68k/raw_io.h Al Viro        2007-07-20 @47  #define __raw_writew(val,addr) out_be16((addr),(val))
> f9569e1d154079 include/asm-m68k/raw_io.h Al Viro        2007-07-20 @48  #define __raw_writel(val,addr) out_be32((addr),(val))
> ^1da177e4c3f41 include/asm-m68k/raw_io.h Linus Torvalds 2005-04-16  49
>
> :::::: The code at line 39 was first introduced by commit
> :::::: f9569e1d1540791f664aeb935b1ec11b6e56507c m68k iomem (based on Geert's tree + memcpy_... stuff)
>
> :::::: TO: Al Viro <viro@ftp.linux.org.uk>
> :::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

