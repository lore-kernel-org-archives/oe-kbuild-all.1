Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A64BC8CE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jan 2026 22:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767826195; cv=none; b=patIlSa5J6gIiCGL/3KHmAVJTgRgnRGAukbj9aJEs6cz1JqYUIRE0iQ2ZhXtrKZvyjGHSOREJPAny1qDi3P7y6NKML9zWQgeCNDx03qwmdk372fAltwl3J3kS2qVqXiotnkR+eT6xuAShWb20O4HnUGvZsA23Cdz+AcM8V8zZ3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767826195; c=relaxed/simple;
	bh=jJsdul+eksrk8IbNATs3uWhc1UKmJhaP5jr/vYpqU3M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gWr2tlzC/1VuWvQ4VxR8EkguMLsApocCtfHW0sJxGsYpgNktE79XG0cvUidP9QpUYNQXxxWchPlq0rTtqQhGmSCpZYQTzpPT6hzRFN78IxA9KtrSGxoiX5EnDjtvkX95zWrpUe1AXzjUx7lWMIvVU6UasbchfLGj0ubx01WQkDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=o/2ZV3xh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LtdjB7IB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=o/2ZV3xh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LtdjB7IB; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o/2ZV3xh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LtdjB7IB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o/2ZV3xh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LtdjB7IB"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8BAFB33687;
	Wed,  7 Jan 2026 22:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767826191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tCxlHLiIr/TNZfu77VkMAcysakh5CqA34G+HZxSLpvA=;
	b=o/2ZV3xhzbsuq+iffMcxRX3U+Tb2C9O08E9h6meEWpXIXYasQxOUyRcFJighVimH9PCTDx
	cUlvqAiUnutOvQMdgKmjP/XTdcHu9lB+bOD3wi2i3fI81e/R1gogwqTRMWvCtQJ/0/Z7G1
	ALmlsU5T7FMC/xDPV5wTHywCj+8uDF4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767826191;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tCxlHLiIr/TNZfu77VkMAcysakh5CqA34G+HZxSLpvA=;
	b=LtdjB7IBxKDSrlUsqBlY50Id/kNDqgH+vmVvdswKOwGRwaRP/3SG6apijGFCK4z+Z0UAmb
	r6E4wHFu1PPHloDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="o/2ZV3xh";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LtdjB7IB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767826191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tCxlHLiIr/TNZfu77VkMAcysakh5CqA34G+HZxSLpvA=;
	b=o/2ZV3xhzbsuq+iffMcxRX3U+Tb2C9O08E9h6meEWpXIXYasQxOUyRcFJighVimH9PCTDx
	cUlvqAiUnutOvQMdgKmjP/XTdcHu9lB+bOD3wi2i3fI81e/R1gogwqTRMWvCtQJ/0/Z7G1
	ALmlsU5T7FMC/xDPV5wTHywCj+8uDF4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767826191;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tCxlHLiIr/TNZfu77VkMAcysakh5CqA34G+HZxSLpvA=;
	b=LtdjB7IBxKDSrlUsqBlY50Id/kNDqgH+vmVvdswKOwGRwaRP/3SG6apijGFCK4z+Z0UAmb
	r6E4wHFu1PPHloDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 59A3F3EA63;
	Wed,  7 Jan 2026 22:49:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id W2v8Ew/jXmmYIQAAD6G6ig
	(envelope-from <ddiss@suse.de>); Wed, 07 Jan 2026 22:49:51 +0000
Date: Thu, 8 Jan 2026 09:49:46 +1100
From: David Disseldorp <ddiss@suse.de>
To: Oliver Sang <oliver.sang@intel.com>
Cc: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [RFC PATCH 2/3] scripts: headers_install: filter ignored
 configs via sed
Message-ID: <20260108094946.70fe0da9.ddiss@suse.de>
In-Reply-To: <aSBsN4WcGYqf8wsO@xsang-OptiPlex-9020>
References: <20251111132021.22809-3-ddiss@suse.de>
	<202511141203.lxo6340i-lkp@intel.com>
	<20251117122306.1db6c625.ddiss@suse.de>
	<aSBsN4WcGYqf8wsO@xsang-OptiPlex-9020>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 8BAFB33687
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 

[revisiting an old thread]

On Fri, 21 Nov 2025 21:42:15 +0800, Oliver Sang wrote:

> + INFILE=../arch/arc/include/uapi/asm/swab.h
> + OUTFILE=usr/include/asm/swab.h
> + TMPFILE=usr/include/asm/swab.h.tmp
> + trap rm -f $OUTFILE $TMPFILE EXIT
> + sed -n -e /SPDX-License-Identifier:.*GPL-/{/WITH Linux-syscall-note/!p} ../arch/arc/include/uapi/asm/swab.h
> + [ -n  ]
> + sed -E -e
>         s/([[:space:](])(__user|__force|__iomem)[[:space:]]/\1/g
>         s/__attribute_const__([[:space:]]|$)/\1/g
>         s@^#include <linux/compiler.h>@@
>         s/(^|[^a-zA-Z0-9])__packed([^a-zA-Z0-9_]|$)/\1__attribute__((packed))\2/g
>         s/(^|[[:space:](])(inline|asm|volatile)([[:space:](]|$)/\1__\2__\3/g
>         s@#(ifndef|define|endif[[:space:]]*/[*])[[:space:]]*_UAPI@#\1 @
>  ../arch/arc/include/uapi/asm/swab.h
> + config_leak_ignores=
> arch/arc/include/uapi/asm/page.h:CONFIG_ARC_PAGE_SIZE_16K
> arch/arc/include/uapi/asm/page.h:CONFIG_ARC_PAGE_SIZE_4K
> arch/arc/include/uapi/asm/swab.h:CONFIG_ARC_HAS_SWAPE
> arch/arm/include/uapi/asm/ptrace.h:CONFIG_CPU_ENDIAN_BE8
> arch/nios2/include/uapi/asm/swab.h:CONFIG_NIOS2_CI_SWAB_NO
> arch/nios2/include/uapi/asm/swab.h:CONFIG_NIOS2_CI_SWAB_SUPPORT
> arch/x86/include/uapi/asm/auxvec.h:CONFIG_IA32_EMULATION
> arch/x86/include/uapi/asm/auxvec.h:CONFIG_X86_64
> 
> + echo
> arch/arc/include/uapi/asm/page.h:CONFIG_ARC_PAGE_SIZE_16K
> arch/arc/include/uapi/asm/page.h:CONFIG_ARC_PAGE_SIZE_4K
> arch/arc/include/uapi/asm/swab.h:CONFIG_ARC_HAS_SWAPE
> arch/arm/include/uapi/asm/ptrace.h:CONFIG_CPU_ENDIAN_BE8
> arch/nios2/include/uapi/asm/swab.h:CONFIG_NIOS2_CI_SWAB_NO
> arch/nios2/include/uapi/asm/swab.h:CONFIG_NIOS2_CI_SWAB_SUPPORT
> arch/x86/include/uapi/asm/auxvec.h:CONFIG_IA32_EMULATION
> arch/x86/include/uapi/asm/auxvec.h:CONFIG_X86_64
> 
> + sed -ne s@../arch/arc/include/uapi/asm/swab.h:\(.*\)@\ts:^\1\\n::@p
> + sed_filter_ignores=

Thanks a lot for providing the extra details here, Oliver.
make headers_install with O=build_dir sees INFILE carry a '../' prefix,
which stops the sed_filter_ignores regex from matching. Prior to this
change the post processing grep accepted such prefixes:
  if echo "$INFILE:$c" | grep -q "$ignore$"; then

I've sent a v2 patch which accepts INFILE prefixes when checking against
ignored configs.

Cheers, David
