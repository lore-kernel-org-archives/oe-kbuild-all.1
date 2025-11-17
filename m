Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C0D1A3179
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Nov 2025 01:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763342609; cv=none; b=tM6HZtZR/5A6oUpixqVbKXKLfA9Qn53eDmV4/XEsomBNu1aOWoR4p3wKWI24Nju+CYFIYaf25MQzywH2zD0D/Hn5rFTwcruuN+Q0ZUZ62YwtVJhBOXhTmgsI45qlpmCXYNzb6GhOO7miMr5W3nwucnBtpz4YJthdx12lmroScaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763342609; c=relaxed/simple;
	bh=xZDzhTjAYLW+IRAtCMoFvZqUrGS97/fpixDrAv4/IGk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C/8HEfdnZrR500sZV5Cwrc3RSnw1kmdTGLx9eAuRA6SbOfd96tCRLXWA3MD5nGQpyCoOXogi5ejyUmduwhxaYdS2Q7Iwln0RwuP1WhyVKOw1+dJzzTURJmTXsVtUTyS+b4gmqPURnHBLlUfz+k6+6fsrp8Hw5L3gpiTHy0+DG34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZREGbiER; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ytV265C/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZREGbiER; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ytV265C/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZREGbiER";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ytV265C/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZREGbiER";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ytV265C/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 551AE211D6;
	Mon, 17 Nov 2025 01:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763342598; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KazmAWzPAL+3/L4qoorGJOI/H6LrcXlQ9E9cPS/bQ/A=;
	b=ZREGbiERuyGu1s7drRt7eY1q4MPL8xE543tg4S8Zuy1VC3t+O4CNT5PmVutyfML8kBca+t
	nkA6MP25ThQRV2QBLI4wBT5xlZt0Yrc4adjBLtv+zbOdVjTFRU3zYv/EvHNXzKRKnTSctJ
	5QAgS1JmZMhrKEbDO61gJ/ppiu1vGC0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763342598;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KazmAWzPAL+3/L4qoorGJOI/H6LrcXlQ9E9cPS/bQ/A=;
	b=ytV265C/wfMtyiHVSpAPzvw3IBrf69EBKLSXzrp4bZUip8WO+JlHfdKBpE39Y0SXuEs7ls
	YVdXg4GSmgbKxvAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZREGbiER;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="ytV265C/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763342598; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KazmAWzPAL+3/L4qoorGJOI/H6LrcXlQ9E9cPS/bQ/A=;
	b=ZREGbiERuyGu1s7drRt7eY1q4MPL8xE543tg4S8Zuy1VC3t+O4CNT5PmVutyfML8kBca+t
	nkA6MP25ThQRV2QBLI4wBT5xlZt0Yrc4adjBLtv+zbOdVjTFRU3zYv/EvHNXzKRKnTSctJ
	5QAgS1JmZMhrKEbDO61gJ/ppiu1vGC0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763342598;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KazmAWzPAL+3/L4qoorGJOI/H6LrcXlQ9E9cPS/bQ/A=;
	b=ytV265C/wfMtyiHVSpAPzvw3IBrf69EBKLSXzrp4bZUip8WO+JlHfdKBpE39Y0SXuEs7ls
	YVdXg4GSmgbKxvAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1B3CA3EA61;
	Mon, 17 Nov 2025 01:23:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1EpUMQR5GmkDWQAAD6G6ig
	(envelope-from <ddiss@suse.de>); Mon, 17 Nov 2025 01:23:16 +0000
Date: Mon, 17 Nov 2025 12:23:05 +1100
From: David Disseldorp <ddiss@suse.de>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/3] scripts: headers_install: filter ignored
 configs via sed
Message-ID: <20251117122306.1db6c625.ddiss@suse.de>
In-Reply-To: <202511141203.lxo6340i-lkp@intel.com>
References: <20251111132021.22809-3-ddiss@suse.de>
	<202511141203.lxo6340i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 551AE211D6
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Fri, 14 Nov 2025 14:47:35 +0800, kernel test robot wrote:
...
> >> error: arch/arc/include/uapi/asm/swab.h leak CONFIG_ARC_HAS_SWAPE to user-space  

Thanks for the report. I'm unfortunately unable to reproduce this. Can
you provide version details for the shell and sed versions on the test
system? I didn't find them in the links above.

Also, the shell "set -x" output for the failing headers_install.sh
invocation would be helpful.
E.g.
  bash -x ./scripts/headers_install.sh \
    arch/arc/include/uapi/asm/swab.h /tmp/debug_swab.h
