Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0186D3164C5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Oct 2026 20:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791662548; cv=none; b=jqDmOUi6btQXgIJbwZxFyqehzYLDupyYmk2SBb7OyxgRR/cqTYYEh5z4n0k1b1aJ3ojWy4LQABd4mStJY91J79XzSpACUHqwqn9veaCtEBzrfW56OdMt5J/5HSX27iK2oStD44MSY1/ULrj7MRwzq6gTWT85JgRaLXPCL4zRcZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791662548; c=relaxed/simple;
	bh=gGCB0WPEet3hBv75jONs1IerdY9HGHiLxa1+0OFMkZY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C9mYQpOiXcMPtxYTeGmRaF7mu+TqiRSZcVFfb8wsBN+9jzTC9W/9LUGbO0U7XovcG0JGKKyA5B/GQ32tOsz0U901SYWyiPtscpBXjtbB4gyJlZA7U2GEx+DY9Yi7DSHUJRmPOz5G60LqAqCyvEnRTQaMmZ8RdKncVHmyzn8q9RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aD+v2X/m; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aD+v2X/m"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3a4c47bb6e3so319807a91.1
        for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Oct 2026 13:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791662545; x=1792267345; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gGCB0WPEet3hBv75jONs1IerdY9HGHiLxa1+0OFMkZY=;
        b=aD+v2X/mDan7aehoIDpaNHAyFRkwySGEBdSAIMF2ZCqrajN5U3zP+ELIaI0Q+3Byad
         Me3Ln2NHuyU9mUBQBjVqEETERY1N1X2c7kUmPPLjsvfCs/4nGE+fyb6+bdDDGwgTEyvk
         Tl7D8dAVYl12SJKalkhBkZn6ZoFbhZoBjgW6Noy7f5WZg0elgbISVfSxw5Y6cAryoKOP
         ze7XHtjZkKd95BjGyCwzFs0LpBf2Gt1lFP8huisHBWSU4fKphAy27RhpwbyBJX46Bkky
         eFYTsOAlsgRtcKR5LPS+TCVLgbBWZcJ+c7TYybDHFHANxcDtJ6U6TzmASUpnfSJ51Axy
         fInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791662545; x=1792267345;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gGCB0WPEet3hBv75jONs1IerdY9HGHiLxa1+0OFMkZY=;
        b=ifAC9tNRiil+gbc+XhJ8E6cTAGhP3BAzM40vTQe1m/uuTN6DKA6SoaEhZz/ottXP9V
         pGOBu7gP+zA+HwJr+UTaDbGPM+Uh0+ZACMN1aso+Jpw9tmMO6gGtxF5K/wxumumvaAfm
         s9nvm1qpmiyFiGrHW8r3VZq5wkA3Ve3K/jHDsnTxmcZcp/RoPmm9imWgMTjXWXJwa2Rs
         5RPl4ZMnqCL3YJnfjYE/DCfX9mzTCY7I1+7uDykpSO5g9/gfns2TWRCLJ+Z8raDeLgQf
         yR6YXi3hrQcqp8ni0jEXZHJRQagbOtVxiQcuM3UYOBpJL6ljrpTNXqwln17Qp+Pi5oGx
         zBuA==
X-Gm-Message-State: AFq9FYINvuaYklV4DU9QRKdyrvLcqd+x0sy6hTaBu55WYqZU0oi5Vjxh
	ZTzTs7nyRLpXg8LZKUY5+sgg9KjeaALEpjO272nZnxnSJG81kzcxxfFp
X-Gm-Gg: AYBFou26vzq3MGjPWkQp7F7cAOOhl5DYxvFn1/ySr6vpXA7reaVM85JkCjbvtFuf+H8
	GM0Ujvh5xKQXALM6LPskSQcyhf9fDlrd72Vgqdb3qq6ua3Jh0A3GYR6ANqWY5QPtnJeAYK8OuHj
	wsffMljJxCay3WMmrpqQJuqMflt4cW3+TPS1odSpP4+4drLNxALTb4IN5OYMc2x9dIhzOn94Qfk
	8HXgEk4Z7R+n3K+LMmYG0zerdEUq8pX60leMYqbZuemkEA9xyvF8zrgOM5e8t/UH0+3ztv8bfZh
	fm4oHqhuqKUjEXYBomael9R4a1I4U6AQvN1IBCZOxS0KC+cQM15NdzEb2i2yB+r9BoD+3lXwabe
	CrBBcfwU4b1TyYGNSHdgcu1bekWZpV0jlRpWMDUV1dFSzL1q8nLMjE66A/aZZ6BME3fbzIEtp1w
	33KKGxORcZ3EV4TPif+eMpD/u/83bk0KZNwiDzsDs7LVTomYmE2zFOpJdbk43OLVpnM9JR9/KWE
	vJrYwSv6CbiytXXt3rPOh1g4w==
X-Received: by 2002:a17:90b:2d0b:b0:3ab:36c4:b4ff with SMTP id 98e67ed59e1d1-3ab3a747069mr4941491a91.24.1791662545218;
        Sat, 10 Oct 2026 13:02:25 -0700 (PDT)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab39238608sm9716284a91.17.2026.10.10.13.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 13:02:24 -0700 (PDT)
Message-ID: <4b4912cf5f30a3c6866a09511c9b5d3a427cb471.camel@gmail.com>
Subject: Re: [PATCH bpf-next v3 34/51] bpf: use SCEV to widen bounded loops
From: Eduard Zingerman <eddyz87@gmail.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, kernel test robot
	 <lkp@intel.com>, bpf@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, andrii@kernel.org, daniel@iogearbox.net, 
	kernel-team@fb.com, yonghong.song@linux.dev
Date: Sat, 10 Oct 2026 13:02:23 -0700
In-Reply-To: <DM18UAZECYI9.1RYCRB2FYDW8S@gmail.com>
References: <20261009-scev-minimal-rebase-v3-34-bcba9bc53ac9@gmail.com>
	 <202610100928.qjEH6jQv-lkp@intel.com>
	 <DM18UAZECYI9.1RYCRB2FYDW8S@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10+b1 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sat, 2026-10-10 at 14:55 +0000, Alexei Starovoitov wrote:
> On Sat, Oct 10, 2026 at 09:25 AM kernel test robot <lkp@intel.com> wrote:
> > =C2=A0=C2=A0 ld: kernel/bpf/scev.o: in function `compute_max_iters':
> > > > kernel/bpf/scev.c:2062:(.text+0x1193): undefined reference to `__ud=
ivdi3'
> > > > ld: kernel/bpf/scev.c:2067:(.text+0x11b7): undefined reference to `=
__udivdi3'
>=20
> Eduard,
>=20
> the series is in bpf-next, so all 32-bit builds with BPF_SYSCALL=3Dy
> are broken there now. Pls send a follow up asap.
> Every u64 '/' and the '%' in compute_max_iters() need div64_u64()
> and div64_u64_rem().
> The rest looks fine. base/step are u16 and imod() uses div_s64_rem().

Working on a followup, will send it today.
