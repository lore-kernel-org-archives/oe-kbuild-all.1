Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339F51C8604
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Mar 2026 19:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772997350; cv=none; b=cLFfhu8C1lrr84eD9gGtlnQAm11QsRZxpU+u8H+FBNfJmx50B4SeA2DPy2ocDu2xv8jUCzMfb3k/7trkVdl4LPKYFlzN06BoPXFqLWnIcCmh1h7RLHbjEAen/MtphpCbr0GtzFqRV0oaCVVpiwtB5drfkoV+BW1VGXk5gjAXQAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772997350; c=relaxed/simple;
	bh=0xcnpUJJhyqglZeTtTQXfmAqkEBYTAu7DCATQ1iL1xI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EWblw0XNKay9MtPd/if2d7pqGOVUnyYqeF3+3cKpNhobnvLyipLKom+F0qt4aHo0wRSdZ+iVzQhMO7UNLCXxlssXCG2UBrbV2rdZeEAUTkznt/SumEVRgRbbKsdyB4X/meHZ18tOlJFyhj8Ky0UCpeShgFmdjH0/1G2k3yRaYAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=R6kp8geV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aDW29QfL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ks+QOowL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L8jvkrQ/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="R6kp8geV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aDW29QfL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ks+QOowL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L8jvkrQ/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ACAB64D1CF;
	Sun,  8 Mar 2026 19:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772997341; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VeBPRksXezAse70Tt+7ogKv9pcDKaJDTH4Vt2LPwsrM=;
	b=R6kp8geVWMvTCc7lSX4xJk5spsmoDVNDUDahX+1vYjO5veg2xR+Vct2SJ8Hd+2nDcC9hq0
	R2ksgQHbVKjhY1SBEONdtrEZ+Mop6rwuXjUR5Z8TiVt6bOtTht3eP3n7q3weAlvL8COVSr
	F6X2kuOrVdwWLaF5icIkD/MUXV9uNDk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772997341;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VeBPRksXezAse70Tt+7ogKv9pcDKaJDTH4Vt2LPwsrM=;
	b=aDW29QfLTqmp8aJIQe9GOayjEqFIHrk70wOqHFmrwfuk8aB0mSXnxeXG99BPkvi8Ssz6Ok
	g4+gDfSb5pOybGBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ks+QOowL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="L8jvkrQ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772997340; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VeBPRksXezAse70Tt+7ogKv9pcDKaJDTH4Vt2LPwsrM=;
	b=ks+QOowL75YH/uYe6or9S1dujLV3zUw3AgYe3jrvuPLZ3USnVI4zgRMYaRbCm3+nMgT+Ju
	27wBbTCWvjgfrMNKnQ8apHTMmRyMWyG5HplEPxppMDW7qEu6y0mtG7FqY3Btk7ZcFMnPXY
	E9d2DY170/j8boBEDedHvLcbK0n2eTE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772997340;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VeBPRksXezAse70Tt+7ogKv9pcDKaJDTH4Vt2LPwsrM=;
	b=L8jvkrQ/ZbG5egK9aWqinnafR+gc2TJ9dfYNH7n0s5K2o65QrIwNzsDJwCPskGhwFrUhCk
	aJxkomPgtAYCTTAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 60C953EAC4;
	Sun,  8 Mar 2026 19:15:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PZXcE9zKrWkiDgAAD6G6ig
	(envelope-from <fmancera@suse.de>); Sun, 08 Mar 2026 19:15:40 +0000
Message-ID: <ea2aaffb-c124-4fcb-9070-a13603f06393@suse.de>
Date: Sun, 8 Mar 2026 20:15:32 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: net/netfilter/nft_synproxy.c:51:40: sparse: sparse: cast to
 non-scalar
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Florian Westphal <fw@strlen.de>
References: <202603082002.ACHbGTsI-lkp@intel.com>
Content-Language: en-US
From: Fernando Fernandez Mancera <fmancera@suse.de>
In-Reply-To: <202603082002.ACHbGTsI-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-5.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -5.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: ACAB64D1CF



On 3/8/26 1:21 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   c23719abc3308df7ed3ad35650ad211fb2d2003d
> commit: 36a3200575642846a96436d503d46544533bb943 netfilter: nft_synproxy: avoid possible data-race on update operation
> date:   9 weeks ago
> config: alpha-randconfig-r132-20260308 (https://download.01.org/0day-ci/archive/20260308/202603082002.ACHbGTsI-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 8.5.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603082002.ACHbGTsI-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603082002.ACHbGTsI-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>>> net/netfilter/nft_synproxy.c:51:40: sparse: sparse: cast to non-scalar
>>> net/netfilter/nft_synproxy.c:51:40: sparse: sparse: cast from non-scalar
>     net/netfilter/nft_synproxy.c:82:40: sparse: sparse: cast to non-scalar
>     net/netfilter/nft_synproxy.c:82:40: sparse: sparse: cast from non-scalar
> 

Hi,

Is this a false positive? nf_synproxy_info struct is smaller than the 
word size and therefore READ_ONCE() should be fine. I guess I can use 
READ_ONCE() for every struct field.

What do you think Florian?

Thanks,
Fernando.

> vim +51 net/netfilter/nft_synproxy.c
> 
>      43	
>      44	static void nft_synproxy_eval_v4(const struct nft_synproxy *priv,
>      45					 struct nft_regs *regs,
>      46					 const struct nft_pktinfo *pkt,
>      47					 const struct tcphdr *tcp,
>      48					 struct tcphdr *_tcph,
>      49					 struct synproxy_options *opts)
>      50	{
>    > 51		struct nf_synproxy_info info = READ_ONCE(priv->info);
>      52		struct net *net = nft_net(pkt);
>      53		struct synproxy_net *snet = synproxy_pernet(net);
>      54		struct sk_buff *skb = pkt->skb;
>      55	
>      56		if (tcp->syn) {
>      57			/* Initial SYN from client */
>      58			nft_synproxy_tcp_options(opts, tcp, snet, &info, priv);
>      59			synproxy_send_client_synack(net, skb, tcp, opts);
>      60			consume_skb(skb);
>      61			regs->verdict.code = NF_STOLEN;
>      62		} else if (tcp->ack) {
>      63			/* ACK from client */
>      64			if (synproxy_recv_client_ack(net, skb, tcp, opts,
>      65						     ntohl(tcp->seq))) {
>      66				consume_skb(skb);
>      67				regs->verdict.code = NF_STOLEN;
>      68			} else {
>      69				regs->verdict.code = NF_DROP;
>      70			}
>      71		}
>      72	}
>      73	
> 

