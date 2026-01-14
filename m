Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D6C1E5B7A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 09:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768384085; cv=none; b=tHicdMkrf+U/v0heaftyYrmZavY5KIf/CyjtAhfZDoweBQf8VR4panSHTB9ap0O8AsQ/fbG4f4Jw4WCUppLjapF46VO96shNnwDzCPVphbzS1DBEasM7FDsZB6tDg419lVIcnnldVTAHwLu5m1E0W5Q/yf77AaHUR7Badg+ugJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768384085; c=relaxed/simple;
	bh=0hz+eN1qUD6+zPOVJK0YzbO/6oD/b5X428oPvrF1wE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BdQB90/4E6RJapOlA/prkie58IHGahzjBt+mlEosnOuya/q+LOIKLAOOt+F8Dtp70CvMTyZXmLkdd0AwoP1rNTqjWW/QcTaHyZ3Cga68AW1OCv+Ln4PQM/7FM4Sn0Ssnc95EsQtDNUtYbhXshFoeV7hUdc60V0JmAMa3Vnw7+Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=uyP33/ot; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=JCXZg9/H; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=uyP33/ot; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=JCXZg9/H; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="uyP33/ot";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="JCXZg9/H";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="uyP33/ot";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="JCXZg9/H"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 54F0133A8F;
	Wed, 14 Jan 2026 09:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768384082; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wCPgzUA/fWvSlyO7YMWemzLfFiJT5RI4JmCZszTQQCE=;
	b=uyP33/ot8vJyHxaQxMGlaqPsY+EfHkRcWkRYzQJi7yc4hhnuVhGBsJ7D32kYvBBMAiaKxh
	oKgDtrMHh+/cDAOE92SODXQYQcbblXt66KUOITl47E2KAP6YkghzLdIjE7avJwvLU6tK0M
	xrkYYW892AkdKMNK0P52OEqgw31HCF0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768384082;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wCPgzUA/fWvSlyO7YMWemzLfFiJT5RI4JmCZszTQQCE=;
	b=JCXZg9/HwDywijqA3dtUM0kh11clykU1XUjOqY5N2Pgh1uHvvtk5u4rG00mz9agdbfB0OJ
	+BRHGWB9ngR+MhDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b="uyP33/ot";
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b="JCXZg9/H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768384082; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wCPgzUA/fWvSlyO7YMWemzLfFiJT5RI4JmCZszTQQCE=;
	b=uyP33/ot8vJyHxaQxMGlaqPsY+EfHkRcWkRYzQJi7yc4hhnuVhGBsJ7D32kYvBBMAiaKxh
	oKgDtrMHh+/cDAOE92SODXQYQcbblXt66KUOITl47E2KAP6YkghzLdIjE7avJwvLU6tK0M
	xrkYYW892AkdKMNK0P52OEqgw31HCF0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768384082;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wCPgzUA/fWvSlyO7YMWemzLfFiJT5RI4JmCZszTQQCE=;
	b=JCXZg9/HwDywijqA3dtUM0kh11clykU1XUjOqY5N2Pgh1uHvvtk5u4rG00mz9agdbfB0OJ
	+BRHGWB9ngR+MhDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 435CE3EA63;
	Wed, 14 Jan 2026 09:48:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QKsgEFJmZ2k2IQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 14 Jan 2026 09:48:02 +0000
Message-ID: <9adb16d4-ca80-45b2-8026-135cbf0f00e5@suse.cz>
Date: Wed, 14 Jan 2026 10:48:01 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [vbabka-slab:slab/for-7.0/obj_metadata 9/10] Warning:
 mm/slub.c:7013 function parameter 'objp' not described in 'ksize'
Content-Language: en-US
To: Harry Yoo <harry.yoo@oracle.com>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org
References: <202601140605.GNpnpgLF-lkp@intel.com> <aWbxLWF0R5rIvRb5@hyeyoo>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <aWbxLWF0R5rIvRb5@hyeyoo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.51
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,intel.com:email,suse.cz:dkim,suse.cz:mid]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 54F0133A8F
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On 1/14/26 02:28, Harry Yoo wrote:
> On Wed, Jan 14, 2026 at 07:00:18AM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git
>> head:   a4e5702b7bb846cf50d2917cadf2289c25720812
>> commit: 1e8eb4117f27366855b192104098330a2f290f26 [9/10] mm/slab: move [__]ksize and slab_ksize() to mm/slub.c
>> config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260114/202601140605.GNpnpgLF-lkp@intel.com/config
>> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140605.GNpnpgLF-lkp@intel.com/reproduce
>> 
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202601140605.GNpnpgLF-lkp@intel.com/
>> 
>> All warnings (new ones prefixed by >>):
>> 
>> >> Warning: mm/slub.c:7013 function parameter 'objp' not described in 'ksize'
>> >> Warning: mm/slub.c:7013 function parameter 'objp' not described in 'ksize'
> 
> We moved the comment from __ksize() to ksize(),
> but didn't rename @object to @objp.

Haha actually I moved... sorry.

> Could you please fix it locally, Vlastimil?

Done, thanks!

> 
> diff --git a/mm/slub.c b/mm/slub.c
> index d3aa805f3e05..373ee58b8b9e 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -7070,7 +7070,7 @@ static size_t __ksize(const void *object)
> 
>  /**
>   * ksize -- Report full size of underlying allocation
> - * @object: pointer to the object
> + * @objp: pointer to the object
>   *
>   * This should only be used internally to query the true size of allocations.
>   * It is not meant to be a way to discover the usable size of an allocation
> @@ -7078,7 +7078,7 @@ static size_t __ksize(const void *object)
>   * the originally requested allocation size may trigger KASAN, UBSAN_BOUNDS,
>   * and/or FORTIFY_SOURCE.
>   *
> - * Return: size of the actual memory used by @object in bytes
> + * Return: size of the actual memory used by @objp in bytes
>   */
>  size_t ksize(const void *objp)
>  {
> 

