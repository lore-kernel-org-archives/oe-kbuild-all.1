Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEAA219F6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Oct 2023 23:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zqRFIJtc"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sdf.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-577c25cda99so174502a12.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 04 Oct 2023 16:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696461256; x=1697066056; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=36YQ6hs4CulOlWopmb6uQIDP4MwhOtjrvzs0PufNoHY=;
        b=zqRFIJtc9r7Q44/3YQB3fLnaJewnxpNFnE9Cg1gFL1Eac2qCHDEOkcRk1CGHrTvQzH
         yewhE1c7DnMrPKtd5reIGDL192/vbD+caNUeSOJmjOPDfiN5Uz5vuvJyK/iqTn5dafyo
         v3+RyJnRBRnfZgqpnWi4T0IzzCmK7SdZmvmuQsIjPIxYuvzrMdKLoj/ngSVzDQ2TwAi0
         Za3zjUMwNupE1KD00ueW2HIcK0S9g91x2MWOxj9Ps9NJWZJIlETyg/WS98vvGpvIUEeP
         arXhfIPRXHLI0r2AfrknY6NqmQmTKpU+MgPeMDtqSJoR1DDxErVEUvVkQW4NGpMuDMfi
         4R+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696461256; x=1697066056;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=36YQ6hs4CulOlWopmb6uQIDP4MwhOtjrvzs0PufNoHY=;
        b=Gk3f8aG8zz0c1dFEzP8SNRNYwkHbOPyUpoF4fWrNja8miK269K0ry5WP+957mmeyzf
         7OzkJIVPPMedpeRda8s+1eky8r3AtAcva1qZx5CDip19P8GC3OWxlzQCacHm7CpHWbut
         SKsChr719L8ffakzkDBE7WCPuVK3DXdNIJ/w1PIyapiq56PAZ3kakCO5vtIBYDzW8rrR
         YD3jyggiyDwPrAMvwvE64eTa+16AIPfq9rvJxA1ULGAQwxyRRVy0FTPYRmKhVBPRcWq9
         4GkaWCzBQLGXlMNUHv+zlGcqS3R72dVUutRSCQBPmGRCyNG7QS5utSG2Yf/J9rbOkBuy
         QHjA==
X-Gm-Message-State: AOJu0YyTNtyrcu5yPAggq6njKyzTZf8eVO0KAd04woM/ssVm7W2eNUTq
	hbdrZD01qWybXhbYgZrTxvJLQ/s=
X-Google-Smtp-Source: AGHT+IF1dARzKf/fT3sJKYBf5sSbvP+H7VtzDteM/5ESZB3A9bkxXET7hdT03ABDAKEs9wLs3IVP1J0=
X-Received: from sdf.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5935])
 (user=sdf job=sendgmr) by 2002:a63:7f5b:0:b0:585:3066:489d with SMTP id
 p27-20020a637f5b000000b005853066489dmr50443pgn.2.1696461255863; Wed, 04 Oct
 2023 16:14:15 -0700 (PDT)
Date: Wed, 4 Oct 2023 16:14:14 -0700
In-Reply-To: <202310050607.UQ0bU3ct-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231003200522.1914523-6-sdf@google.com> <202310050607.UQ0bU3ct-lkp@intel.com>
Message-ID: <ZR3xxlNEyLjfWGgx@google.com>
Subject: Re: [PATCH bpf-next v3 05/10] net: stmmac: Add Tx HWTS support to XDP ZC
From: Stanislav Fomichev <sdf@google.com>
To: kernel test robot <lkp@intel.com>
Cc: bpf@vger.kernel.org, oe-kbuild-all@lists.linux.dev, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	song@kernel.org, yhs@fb.com, john.fastabend@gmail.com, kpsingh@kernel.org, 
	haoluo@google.com, jolsa@kernel.org, kuba@kernel.org, toke@kernel.org, 
	willemb@google.com, dsahern@kernel.org, magnus.karlsson@intel.com, 
	bjorn@kernel.org, maciej.fijalkowski@intel.com, hawk@kernel.org, 
	yoong.siang.song@intel.com, netdev@vger.kernel.org, xdp-hints@xdp-project.net
Content-Type: text/plain; charset="utf-8"

On 10/05, kernel test robot wrote:
> Hi Stanislav,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on bpf-next/master]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Stanislav-Fomichev/xsk-Support-tx_metadata_len/20231004-040718
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
> patch link:    https://lore.kernel.org/r/20231003200522.1914523-6-sdf%40google.com
> patch subject: [PATCH bpf-next v3 05/10] net: stmmac: Add Tx HWTS support to XDP ZC
> config: riscv-defconfig (https://download.01.org/0day-ci/archive/20231005/202310050607.UQ0bU3ct-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310050607.UQ0bU3ct-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310050607.UQ0bU3ct-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c: In function 'stmmac_xdp_xmit_zc':
> >> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2554:17: error: implicit declaration of function 'xsk_tx_metadata_to_compl'; did you mean 'xsk_tx_metadata_complete'? [-Werror=implicit-function-declaration]
>     2554 |                 xsk_tx_metadata_to_compl(meta, &tx_q->tx_skbuff_dma[entry].xsk_meta);
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~
>          |                 xsk_tx_metadata_complete
>    cc1: some warnings being treated as errors


Missing "static inline xsk_tx_metadata_to_compl" for !CONFIG_XDP_SOCKETS.
Will fix in the patch where I add xsk_tx_metadata_to_compl...
