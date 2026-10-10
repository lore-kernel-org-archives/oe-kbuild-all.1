Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4952E7369
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Oct 2026 14:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791644142; cv=none; b=oLyH3QwP0iopLcoqyieXjKF8+70+HN2VfYWxSccI9vvumexmpaP0Tn20pnNztMVmLebdXxPztNrOXXeyrZrMEbUk/VUNnePNEwMeF643s1n4PEtpbxwL1mlTQ3TGMo0nNw9PF5NQ1rZ8gZXeHAJGsauJ1HVipqPJr9VRZ2qWCUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791644142; c=relaxed/simple;
	bh=K1anK7ermLyljJdUOnkPbudUZBD0dhcLb1MXiyRyuos=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=oD9z6Qmh5Jx0SZgKl5miAVpOOvDCFkUQquyEjSrSHnWffDPDs7dowRWkucMa5mlsybQXNWl1aHJBfwfsz9/OHVsqGQiKFMrK8vrJI+NcZtQq3NPDVI7H3lem781ednvfwcrTchIVBW8k53yoZ8Ljj4QvPX0wSxPAd0dCMfnh9gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fESVpYef; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fESVpYef"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-398a5aad413so276486a91.3
        for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Oct 2026 07:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791644141; x=1792248941; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y9MdWwrL6HyhifnAJtfaGhfthnB3rL3CnMKkRHEj95k=;
        b=fESVpYefilZUksd6p+DovTFnWO7aPzw9BcmKV1eetcXIN7UBpemhRkKkRc0U95FgVC
         G55NgfhLmk3VL9zYfvQ5Kl6z80lxvKwkukVf5n8D2wi6oL/l0nUekRnY21atavX0Y1Fj
         A4dAZZQjffzSn080erSMco2TAgEx7+QytC3alZUt4miTkaThNDly24SGiCOJFrJdXC7c
         mMr1XUlL2YHpIszlgNtwKtfa7ichMIXLD0f31wAYjT0aMFiQ3kKeb/bdKDoqWceCA9Ky
         5eh51YsSYuOz+bYV7JvEBKEU/WOsXMCX7CLbA2m4jLhggeoYN/QNzX6auD7a5FB4tZTw
         EmeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791644141; x=1792248941;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y9MdWwrL6HyhifnAJtfaGhfthnB3rL3CnMKkRHEj95k=;
        b=e81TCfSqJE9vt/gbJlu1n+Qe+s+U9xZKjsEcH1RrGU9ngIsvArPIrYHKek7VMshTp3
         0zT07zcblPUyYjo69L4JDulGYPf8b2IO8EWQHQl6xJSxTR6u4LrRGlsMM3cGiw5kSWR9
         7cMRAIBZlMEYABw9TIJWlu0Ns79WFJJUdBic8sSQBS/HCw7L7bU8z7uzttKP0cLlLUd8
         Kr2FzT7ILN2VIaDhBtCd4cHVygVL5akUlFyUEo7S+kyO5PtVAHydOUZEa8BdVCOPh1gn
         Ab45Bdk0OMzWz15Dpil3SOnqFoxTdaFjlHNezUPDoTan8ugWO6O208U7pzQyjaCZEzf7
         SdBw==
X-Gm-Message-State: AFq9FYI6IKhwop/4fS2s4N7EDzEM5OxML9yYP1GUJPi4q+InN0Ivd8wf
	8jvnzq+n8eJVzCxRPjOZCrHABdP0sxHSGJoDvq8/BB4P2tgNv8aD5UY1
X-Gm-Gg: AYBFou2+9HfOLWq/NBtLXU8JToALUxwLE0ONfzu6IfAMd1iprwhh8H8NTLPPAObZFF5
	ixDhuDGodTnhcEqSsZhkBmSKCHA3idRza4C+zBiAUVDOTpd1zSMbd/7xuPvjeWyGGaO9sU5evm3
	1qYffV8+kBA6FcSGAsVQ/uis+dEoHQu3FkiOzjEz3GkmGTjxv9/3tKqx9NKrC+YPkkbW0zaSzhk
	Le8OMJy7qpu3++D6Z2sR/9+5OU9SeVg1/BQR29A28Hae6v+KKYIobmQ3ohiXFxVEFUUda9+Nkbc
	38vkz+nyzuqDY/EqfJTk59Mr648TR2jH1om23SPByeBrrpeolXckNwWN3my28fTdceTWfJxYQ+j
	kfu9GwgQRY44p2L1jwVoB3yh4D7x9v7D95YnHuxOrn28+OZJzcHOmHALUHYuHZdY+8X5dkMVNk6
	b3oArKKhA8G7aPeTfuIs+kipoEVS2Veg5TnW6aa1xwSOcRoffxDB0qvoof22U5VJ3pCijOT5na8
	l+EVmAbX6KD8CM8+usx1WOlik/Xy0qBus/vgi+S1W3KLLjbcngmrGFJxZMX6CA/W2yNIny6GJ2p
	B+0=
X-Received: by 2002:a17:90b:4b:b0:3ab:2c2b:1030 with SMTP id 98e67ed59e1d1-3ab3a747cfcmr3883080a91.22.1791644140387;
        Sat, 10 Oct 2026 07:55:40 -0700 (PDT)
Received: from localhost ([153.61.198.245])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36f46dfesm8487649a91.8.2026.10.10.07.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Oct 2026 07:55:39 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 10 Oct 2026 14:55:39 +0000
Message-Id: <DM18UAZECYI9.1RYCRB2FYDW8S@gmail.com>
Cc: <oe-kbuild-all@lists.linux.dev>, <andrii@kernel.org>,
 <daniel@iogearbox.net>, <kernel-team@fb.com>, <yonghong.song@linux.dev>
Subject: Re: [PATCH bpf-next v3 34/51] bpf: use SCEV to widen bounded loops
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "kernel test robot" <lkp@intel.com>, "Eduard Zingerman"
 <eddyz87@gmail.com>, <bpf@vger.kernel.org>
In-Reply-To: <202610100928.qjEH6jQv-lkp@intel.com>
References: <20261009-scev-minimal-rebase-v3-34-bcba9bc53ac9@gmail.com> <202610100928.qjEH6jQv-lkp@intel.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sat, Oct 10, 2026 at 09:25 AM kernel test robot <lkp@intel.com> wrote:
>    ld: kernel/bpf/scev.o: in function `compute_max_iters':
>>> kernel/bpf/scev.c:2062:(.text+0x1193): undefined reference to `__udivdi3'
>>> ld: kernel/bpf/scev.c:2067:(.text+0x11b7): undefined reference to `__udivdi3'

Eduard,

the series is in bpf-next, so all 32-bit builds with BPF_SYSCALL=y
are broken there now. Pls send a follow up asap.
Every u64 '/' and the '%' in compute_max_iters() need div64_u64()
and div64_u64_rem().
The rest looks fine. base/step are u16 and imod() uses div_s64_rem().
