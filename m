Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792979533;
	b=4kn5bW37A59Xe3B7fz+sWYPKVBcdVYe1oBG0Q1b7e0PLfUYQ6ZrwpsVJQjeHjOflqMA6
	 BH7/to3O7P6fgr/Fml734v75ewLvDF3tmy5vYtMPLW2hJaw/hpDkJwds8CjTkiK780thu
	 n8TMUNOjcXlPRXYI72FlMJVusUvlDYmvop/o/sF3k59nz5/YPCHHXQdcpdVnfGlyG+Ebo
	 IK6I/PhwrhqqlKuTayAkcw5+ajbtCCihfTmfsvHfJdArYQ1Ap3rWYSm25Tyxdprxqdg4S
	 ss+381lugNf+EjTZCIjFppmR+dd119n4ryJpGnylmd+pVbivOKqvcBysLOo+Ekgsupw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792979533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:Cc:X-Mailer:References:In-Reply-To;
	bh=Q4By7A8PZiT0yThEZVJLfPkmZwSfEFs737xPwhq6ne4=;
	b=SujaRLQzwqqoYSVMS5JOGaU51dZygwz7eIbe4fOyW6Wg/+UOyfqorzTPE6Zbyuum/vxH
	 L/EIphGLbwEWTXEzTOFfFUEFYjMSZrX1FINqYXluaF4pe7rjmCXxo8AQoqNu1qSJ7pbL0
	 68RHPDA1MKgFYxQNpzw4bChAEq9e/K5KG9pDaemhdAcH941lJ2VHqfWAYl5TVY+yDKW/d
	 ItsR8GpZD84R730rU1qot7lb1ZMTwhjnEM7OUK8BojdIy2sZik8Hg8hnKn8nH+QPF/rmQ
	 6BE7d6e4fQ7kHAgYq5fz0/DR7wZ+xncyqaVY9ci+6IMfQpOVrqQ/9PCzTdSKTrxOsKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iJqOGcq8;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BB1606A31B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Oct 2026 01:52:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9BB1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iJqOGcq8
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ccce6d9abfeso1574943a12.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Oct 2026 18:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792979532; x=1793584332; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q4By7A8PZiT0yThEZVJLfPkmZwSfEFs737xPwhq6ne4=;
        b=iJqOGcq8VtalbxqyWeqVmQXLDY3/TuwkCLBLk3kE8hvvmyzT1prsphyEzGoE3hyoN3
         9XpFSLvpr0jiB+y5+05CrNFpfz0t0AEtld4slEWFXD+b5CY4BfkAkBYuZoFbSLwGLZfh
         YWRNhmRCH5QlraTR/La30LLEQW9DQD9c7lJwtt5PVqd2KcpxfkEexgbF3ELKhJqhvRaB
         rVM8F0Ux+P4n+zjwVCDYq4WiHgdjy2qlD6y55OplJgp/6MJL43Tl0vEIftDSXoW6pkJb
         r3SH7IcD3vGOdQ4CYYEweN/pAPJSApMJylc4SNncNn1g0Id3KH/aTx9nkJ92S+b7r0Q/
         T7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792979532; x=1793584332;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q4By7A8PZiT0yThEZVJLfPkmZwSfEFs737xPwhq6ne4=;
        b=ze7dj86u5vzgzvcsuLQgPDXvEA4CHyQIExrMrV+mLjNL8OZKPFytlJia2dTpLGdfpE
         uIZPEsIDpoUe8bks2uBNgnsq++AuLqNh3Rejjz+K74HjxPVZTMDZgYP5+ZtGvYOwIqq+
         nLObVx3GOsvGfRxttNB5RsHljXR3uI4rhmoTxb9kD3WLksqjRiui9njn/RyXKtlEcZM2
         XNN9DCDkxRTpwrDaVkxO5mfNoqUcqRu1KGmdpmnCL6URyqC2FZ496/DzzatxRVHmMx1O
         zVmhdBPnqcV6+Y6rnQfLyksm17STmW7RLQrZGW5CM052I91h+fGJ9z7SlNoQd6cZFMu0
         GCtA==
X-Gm-Message-State: AFq9FYJF+TCyjJufegTdWmGiS+pNKQwfKM2TqS+Fd8XkNJ5OlE9ITFYS
	0F4N4oowBDdTlImDxv89eISeo2IRcjSRgPe9q3bANEdM5tD2HTXugjEg
X-Gm-Gg: AYBFou11MBitBFLN9qEkfaXK5OJwnbVIdzE4LQt3g3DeE3ig4D1OgNdVs4B1KJHUzZ4
	8fJp8z5v/CiFPIi3Qnw+wkVfORDyTsa7iHFyty6s+95YO+aifiJPMaZOotdsN6uccKFTfhkkP/r
	G62dccGSQopX6JAcNMGyzqG0jYTTIp/qEig9Lw0dBywAyZkcds0abnGSHgjtngmTS0+O2Ri0KGF
	7pNgn72iOQyP+WhvAQrs2yPn+ALfxKM3QetsQK8kZvNVVJfU4ia1VRNm7oXL2bJud/tG6Yb9F94
	L0zrUzXuZX7FQFkgdtS21+7HuIOa0CXo368+lKN6C8JZqG9DatiyoT+QjuQkJkem87x2onJjrG0
	65DxGNgu7KzlWLcr/8ZHzXj8eu9lxQx3ZPt2DUaegLstiu/o4XJLKL7P3pcMPX7y67TGyroq84k
	vvGAKvZREJjz5YtEzrdDP6c9Hx7I9mJ14dKs17+dZ9bkBBpqowFMh3ZCMDIFnJqhlGt7Xl5QEMo
	ar8AAs/3fWejn52tBhbzoo+HwNrt2rpiEoUGcumHMhrpQ8AqMHfRx87OVurwK8MSlXhivWjiNCl
	EeiRq9kwRMxcGzHATmCZb5sFWaxqvvBlB7WN/bn/iJ+zSKRaEipUMUHouql0bQ==
X-Received: by 2002:a17:90b:4e8c:b0:39d:84af:a0b3 with SMTP id 98e67ed59e1d1-3adeac07c4fmr4703213a91.18.1792979532216;
        Sun, 25 Oct 2026 18:52:12 -0700 (PDT)
Received: from localhost ([153.61.198.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc90d74sm947223a12.20.2026.10.25.18.52.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 18:52:11 -0700 (PDT)
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Oct 2026 01:52:11 +0000
Message-Id: <DMEE75PI8G2P.1AKZRLWQKYJ4C@gmail.com>
Subject: Re: vmlinux.o: error: objtool: do_jit+0x4f77: relocation to !ENDBR:
 .text+0x24c3b5
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "kernel test robot" <lkp@intel.com>, "Alexei Starovoitov"
 <ast@kernel.org>
Cc: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-349-gb940a4174a3e-dirty
References: <202610252131.3Wl3JYJ5-lkp@intel.com>
In-Reply-To: <202610252131.3Wl3JYJ5-lkp@intel.com>

On Sun Oct 25, 2026 at 8:17 PM UTC, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   21a7f44fd0765fcc5194130b28767786eba1d1e7
> commit: cff94a3d78d8cc12ceaf60aa9272aac422b1dc39 bpf, x86: Support unwind=
_goto and unwind_exit
> date:   5 days ago
> config: x86_64-randconfig-r2107-20261025 (https://download.01.org/0day-ci=
/archive/20261025/202610252131.3Wl3JYJ5-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20261025/202610252131.3Wl3JYJ5-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Fixes: cff94a3d78d8 ("bpf, x86: Support unwind_goto and unwind_exit")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610252131.3Wl3JYJ5-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> vmlinux.o: error: objtool: do_jit+0x4f77: relocation to !ENDBR: .text+0=
x24c3b5

already fixed in bpf tree.
