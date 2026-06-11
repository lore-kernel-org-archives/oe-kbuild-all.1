Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882293002C8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 23:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781220116; cv=pass; b=Qi5Zix2KX4p06eMgGYj3IldRz17bWpxbKyY96XLaBbZj7ab0u4K2+NekyzfU95OqgdYeX0c+i8+sdZ25GnnJgJclpuc78/Z3j3cItU5uHR4HQGm29PGoA5aaonhLk//AyoIZNP3ySkSMd6/tkWyB47KZkHeZUFP8VwvTshErkBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781220116; c=relaxed/simple;
	bh=0KOpocfsmYCErQrwt4UlLZ3PO2wHR9usv0qa6UVTPaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T0IsoRGg0fbLin4kEgoNhCQ+lEJ8vSB9tqZknr3/ql3P91xsz/atE0RgXwSWmPi7P+oitWm6u8huqhZy2cjkNYEgk/w8KtpqOiMfJXxcgkCfxe48jvvyXcNhL89Uq8Q5Xuw3VB/smAV1LqVh4pzwZJl7cjUneI34t53YYrgYHGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dKRVgEqb; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dKRVgEqb"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-68d22476e88so5119a12.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 16:21:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781220113; cv=none;
        d=google.com; s=arc-20240605;
        b=S1h7ErQgNMEEzFfmt4Djdap8gGgxq4joM/BzhRHVzkSceJ8zmZoZml3hGvsawzRrPz
         z9Jy1aKGzGsGOT7dccsQ2IFHvq0ljGt1bBriw0VJSADKSREWI7HGzPgtVVbsCUwWOAt8
         trYHJfljyaJTkACTyDq8QvEKFzQ6dupazf8dcDrvtsDpw90GEcJk2hUyiAjzBM5cjUAH
         /nV2n07JS6Odkm2yVzlKXm0VxYhcf9GGtBht+8TS0l+HOswWwEFpxbxQcr+9vRfWL/+N
         LNWYzTVtvaPdjfGYs2oRuMEpHG+L29EHB2SUmfMBVMFiBPb0DMsTMqT6xjDnxW1EWPnv
         GM+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wy4YG3+WLKT0bnxTi4rcDviiXmMXkNuh6SIVgT2Ukbg=;
        fh=msSBXnfdr7xAUBE2DLRXfSDkgf7lMGXHfDgRCVs8sjU=;
        b=GYOkh352+KVCjyrzZlwJSg0ALaI1P0/JLqbPuL1m5LSSm1dHqY6o8GpO8TcJMh2fDS
         Lumi2TAHZSfDO6+KAAHI8O0K9lqk2wTopiBDaP4ZigbFN5Bj4X8usFRotFGmpXrQtspz
         bfOLzuJkwBZy5IBTLJ09sDEYMfobNPA7CbkrF5OAgLeWG65aeRB45TD7GIYpJFirSedf
         6LNyL02kniFFpMfxHwxWbrolsw4Lipuw2ZawAs+cd+5FED3i9UrmM9lkS6hjBiZDy5HK
         DOHXjPKgAq+nL3xp2mb5yWgLApnhMK2uIWX11rHPqjEy70393QR8S23Dicghlg+iBb6I
         qtOQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781220113; x=1781824913; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wy4YG3+WLKT0bnxTi4rcDviiXmMXkNuh6SIVgT2Ukbg=;
        b=dKRVgEqbS4Awj9V84pelvBl6uB6Q3evmUwWXLyqNuKy2QVNDnM6mEU7NlZbrUgjwRl
         TRxQhI1RsGRLylbrqS12jUr0D6UW2hys50wQS0+M44BIqIEK8TJFEdBNtsLzqGQygQiN
         OPMWWixjgGaIh3Y1U/gbkM3ll3Ka67Sdmk5vFXY5qpJEiqZzztA76qHGOGZyxDHnTtNr
         EaIl9E4oqtPOn+SFhC0gMlZHqokMSCTOoZ+j+HtIkGbVSRxN+SCFaoAsuezzoHxt0/ri
         imzauyhJhXo5Xzocpoxm8Y2v6Ji3l3p92Z9UxzqWeVuhclITXh+PiR4Ok13ksDBfJRiU
         3y2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781220113; x=1781824913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wy4YG3+WLKT0bnxTi4rcDviiXmMXkNuh6SIVgT2Ukbg=;
        b=aUD3+2FKFgIR84hFINU4EALiGQ+8y3Etni707ZmZZ4DJIf087FvkF0ydksUcyKJNZR
         Cfmx8jMEwukcLnzOntkdNs10zvi2ibYl7Ife5ccsQ08j6DlebM4Tu66yakt4T6R/qoV1
         +qisuft4ZvIYKNFi5lP8CD0sFfFIEcbLyDx4na+dYdZAVycrui33KkCGPxZnW74mD1lT
         n68S0m18XMlc2J1Hsqg6EdyJdBd9ILZARmbN1xQnLRFA510QZBbSkCmaNx32/HSmjsll
         Vzueu8XGpGQxqsJ0LuC6mYH3ZkW+YmymkxTLO9CYiFaREFclZtKWGnlXFQ/nzKMZ4jtQ
         ii+Q==
X-Gm-Message-State: AOJu0YxEbv3uUiSm6QcDxEKMlFK1vD7xiAxbM2z3Zts9V7JTYOj2SCcV
	gNItNNSRpcWetbfECNL1FANt/zgMkiPJN2cDInxXGqjSf89tn7W5KOILMfF3iwYbXQ/gMu1er0F
	BUddridDMbbEHqXdu3pu/q2Fu/dyggxAVj5rCUKnN
X-Gm-Gg: Acq92OFj2HljwV0qSk3sjgkN6dqIEKZasqh+8d+oDJ9FwRd56BLdWKqSFsqo8Zp1D0O
	RtRdwByUBFlqW30aGtkVKIAvP1wxuDM++ZxZU0f/dLIXpY4XiNafaPC/BBzuIVlLarTLyJdguAX
	6BWn9HQcMTgq64qMWEjxoKqwfUflSTj/+rdouUeCU5rg4HCRg1oiY60+WbD4P5vuuYB1tshvdfN
	k5tGLT3FNBNbaFwi3jrH5vkp2RpTGQ41i8PJjLCchhL4AHnkO4S9VojgUl126lMZtlYD3HVHjVW
	mUDlSHz63pVi3obxqUY85zGxuTz715+rFTkfbJGvofQ1j5TH
X-Received: by 2002:a05:6402:8c9:b0:68f:d41d:ca5e with SMTP id
 4fb4d7f45d1cf-6935eecadc7mr15088a12.12.1781220112434; Thu, 11 Jun 2026
 16:21:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202606111233.kM8oo8Df-lkp@intel.com>
In-Reply-To: <202606111233.kM8oo8Df-lkp@intel.com>
From: Rong Xu <xur@google.com>
Date: Thu, 11 Jun 2026 16:21:39 -0700
X-Gm-Features: AVVi8CdgA8mX8CeIPVrEHy6IFhrCA6FbgvbVngnIuaNjUMiAHxPfZKuMrZPHN8M
Message-ID: <CAF1bQ=Q41e4vAT357Cec+CfsacPmOYB1AGWSbuy-ujh2wUw=HQ@mail.gmail.com>
Subject: Re: [kbuild:kbuild-next-unstable 25/32] WARNING: modpost: vmlinux:
 section mismatch in reference: tcp4_net_ops.llvm.4527429266264891517+0x8
 (section: .data) -> tcp4_proc_init_net (section: .init.text)
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I looked at these warnings. They are from the distributed ThinLTO
builds. But I believe they were caused by missing section tagging for
the data and functions in these network source files.

We need to patch the following files to eliminate the warnings:
net/ipv4/ping.c
net/ipv4/tcp_ipv4.c
net/ipv4/udp.c
net/ipv6/addrconf.c
net/ipv6/addrlabel.c
net/ipv6/ip6_flowlabel.c
net/ipv6/mcast.c
net/ipv6/ndisc.c
net/ipv6/proc.c
net/ipv6/raw.c
net/ipv6/tcp_ipv6.c

One example patch to fix this:

diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
index 8fc24c3743c5..1244fdf74c3f 100644
--- a/net/ipv4/tcp_ipv4.c
+++ b/net/ipv4/tcp_ipv4.c
@@ -3318,17 +3318,17 @@ static void __net_exit
tcp4_proc_exit_net(struct net *net)
        remove_proc_entry("tcp", net->proc_net);
 }

-static struct pernet_operations tcp4_net_ops =3D {
+static struct pernet_operations __net_initdata tcp4_net_ops =3D {
        .init =3D tcp4_proc_init_net,
        .exit =3D tcp4_proc_exit_net,
 };

-int __init tcp4_proc_init(void)
+int __net_init tcp4_proc_init(void)
 {
        return register_pernet_subsys(&tcp4_net_ops);
 }

-void tcp4_proc_exit(void)
+void __net_exit tcp4_proc_exit(void)
 {
        unregister_pernet_subsys(&tcp4_net_ops);
 }

I'll be sending over a patch for people to review.

Thanks,

-Rong


On Wed, Jun 10, 2026 at 9:21=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git =
kbuild-next-unstable
> head:   7158c5b67e92e52c2ca9a3617a7e768a84031da1
> commit: 9f2aee8f7d1842be08da860e45265d30dba0d1f7 [25/32] kbuild: distribu=
ted build support for Clang ThinLTO
> config: i386-randconfig-r122-20260611 (https://download.01.org/0day-ci/ar=
chive/20260611/202606111233.kM8oo8Df-lkp@intel.com/config)
> compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e984=
6648fd6183ee6d8cbdb4502213fcf902a211)
> sparse: v0.6.5-rc1
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260611/202606111233.kM8oo8Df-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606111233.kM8oo8Df-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>
> >> WARNING: modpost: vmlinux: section mismatch in reference: tcp4_net_ops=
.llvm.4527429266264891517+0x8 (section: .data) -> tcp4_proc_init_net (secti=
on: .init.text)
> >> WARNING: modpost: vmlinux: section mismatch in reference: udp4_net_ops=
.llvm.17425824324074326067+0x8 (section: .data) -> udp4_proc_init_net (sect=
ion: .init.text)
> >> WARNING: modpost: vmlinux: section mismatch in reference: ping_v4_net_=
ops.llvm.5641696707737373282+0x8 (section: .data) -> ping_v4_proc_init_net =
(section: .init.text)
> >> WARNING: modpost: vmlinux: section mismatch in reference: if6_proc_net=
_ops.llvm.7870945277386035298+0x8 (section: .data) -> if6_proc_net_init (se=
ction: .init.text)
> >> WARNING: modpost: vmlinux: section mismatch in reference: ipv6_addr_la=
bel_ops.llvm.5745897517271459135+0x8 (section: .data) -> ip6addrlbl_net_ini=
t (section: .init.text)
> >> WARNING: modpost: vmlinux: section mismatch in reference: ndisc_net_op=
s.llvm.8806210167060761094+0x8 (section: .data) -> ndisc_net_init (section:=
 .init.text)
> >> WARNING: modpost: vmlinux: section mismatch in reference: raw6_net_ops=
.llvm.3743523335772203324+0x8 (section: .data) -> raw6_init_net (section: .=
init.text)
> >> WARNING: modpost: vmlinux: section mismatch in reference: igmp6_net_op=
s.llvm.7071106350580158050+0x8 (section: .data) -> igmp6_net_init (section:=
 .init.text)
> >> WARNING: modpost: vmlinux: section mismatch in reference: tcpv6_net_op=
s.llvm.17505177970592326146+0x8 (section: .data) -> tcpv6_net_init (section=
: .init.text)
> >> WARNING: modpost: vmlinux: section mismatch in reference: ip6_flowlabe=
l_net_ops.llvm.6051723423336054316+0x8 (section: .data) -> ip6_flowlabel_pr=
oc_init (section: .init.text)
> >> WARNING: modpost: vmlinux: section mismatch in reference: ipv6_proc_op=
s.llvm.7829948594772821810+0x8 (section: .data) -> ipv6_proc_init_net (sect=
ion: .init.text)
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
