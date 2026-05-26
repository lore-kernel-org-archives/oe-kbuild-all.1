Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1043BD646
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 23:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779837712; cv=pass; b=nng3pTB514R3uJfQAJn4Ikgm6xFVxv5+da1sKxhYbiQrQ6gjWNqDvsxev0GFonKdJ1FSEaY8BXAeg0cyC0f9/zpwj+l3e/ENEbQRtqUW/o2UMRgUGJ7SVLhKMQkiLuXFizu0TpQNVsaVOzsAFl+2helVgLkbsECAKo+mril0hF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779837712; c=relaxed/simple;
	bh=u5AZ6lDvJHN6hkOMWJlEHdIYy+BPs1w8b0bOdZZRyJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J8P1loUVUomiiqG9jxUxwmMUebwmX8mlQo+8Wpdy0jft0r43JcylwcnNbckyPyjoJFck8OCFktOuizbYdXtThk41HbgyFc4aVq2TynN5Q1N8nv3tM9JIwgnVvn2FjUsLWDOX4WWGLoZnoITs+NEORCwa+iygIRfRq/nriaBScMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IjbisMCy; arc=pass smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IjbisMCy"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-43bf6230cffso1231951fac.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 16:21:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779837710; cv=none;
        d=google.com; s=arc-20240605;
        b=AYSFnMpdCBa2UVwfxOuVG+BDIEfQRRAjc6K8Bsb8fGj0NeOoQRkyqWxdmjYy9Iby7p
         BAe6Ey35tqF6FQ4ZQedrTKLyEgHXMDuJQuuDf5P8hOwGW5nZRGqQAhWapbka0II0H8Kz
         5L3usCW1MiWDPpRayqscFd7YzxGVK7xOaiKL+3yk9PzA9e/abykO8nP/AuuswS240pRv
         oRbnkoparJEu137SiLFvEBINWduPJ+eODZI3tfsej3fKgDmwgRsJJQXB9ITfF1BfblXv
         1ITM/9jWQbvH2Ds/64213rdhcAshbnoV+gjYr4+q7tKXLNeG/9Jt6JR7657Yj7VIwldC
         Jb5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HujuVBuKdWWEfICM8n6u8a8X3rF3iweG2fpAlmRVj68=;
        fh=+MVa0oVDkgqdaBqrDnmqW34ZQrdxpDMu96rRCKIVhrM=;
        b=Melwy52BE7vKt9K/ddGz2XJ0uEYnz7DzbZJRtAz8ZJ0PX2HEOlry+NJQaGPr2ai0fB
         vedey4Rs31N2nGydjF14ySLUY4r9PNXE1Fg1Qj2j9wgytUA9mdXTVidyVwcbv0I8Yaoe
         DVwWIt5eqYdPtT1MZaRzfzrk1Lb2HHJkVno3IdGhNmkQYLyEArvnqFod4AAIndL4ft6w
         CcEibr04HOzMTo6p7vAVAiRiEKbDtcbWHKNz7qLtBxNdHsp6bGaeB4OS5uftdYV26s7+
         +PrxY5x7cz/dfLuEFjEgrqMkmNJZS47Hd4XwJq4vtX0nEQDOVmc30EMUBwIEKuaQ5uPX
         LyAQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779837710; x=1780442510; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HujuVBuKdWWEfICM8n6u8a8X3rF3iweG2fpAlmRVj68=;
        b=IjbisMCyHHaOTMObJ8rRqf7o37IhBvSJhF0xHjmOwSaQIZ+0L1MncSDfs8h+M8G6dh
         u469rSLTjDWFcnk/dV2DnLdQgC6kMIolUMNCXmyKgwcALGN4giFBVmjhLmMRr8UY+FDl
         VwEER6NG3T6/Nc4h56PclcUx7xTfNhqhh7gkcjDde2r7Kg7/AvOmbwriXf2EXmud4Aqc
         SMEjim8D8T2G2LApAlcWwUTGcqvwjnm+9in3V3XH0E12qUD1/mf5WkIDxDweQevnhjhu
         dv8lymkh5Iii/F9OK3im/jQuUa+FMFrJsPXAOgvGaMvN9ngYHlXJfh+ZGIrFcswSbT2Q
         APHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779837710; x=1780442510;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HujuVBuKdWWEfICM8n6u8a8X3rF3iweG2fpAlmRVj68=;
        b=nis1yOS5gIBFO/uCGU2tCyxHfA+0XIBHgghVtW0KbHI5mpdRp15JDS/u9ToCeZeSrs
         TIwxGGd/Y62r2um8dPBGVpsQZmXEnsd0sV2zsP64FmrSXaDS7fxYkRD9WJEurH928s2U
         88rkDkVLK3lERIFEi9p6iXRDS2+3OTGfRb1MHc9T9zz8FYfV2xKi3FIPW03oPJuliGzm
         jEjuCuaDzuSFmAGlYsicJJmHoCjrAwmSXApSQe6TksFLbq4rdFTUUU6UlDitRxueBDat
         izALlW2sglza3aZ9dWYIgS4ZGWnt+SKK0GvMv+r657vch2e4dLfFU5ba4eo1D9huOFLV
         IBrg==
X-Forwarded-Encrypted: i=1; AFNElJ+Is+/SlENAU9jrfBS/6bNRTQKujhFiQzAAI9b25NBu41+HsumCeiHNbfH7Z4jG6PgSUJgL5AvQs6GDiByO@lists.linux.dev
X-Gm-Message-State: AOJu0YziBZRVw9+KvMXoGAS6DK5a/YYa8v2L1cnmPsRSAdKXrTB3ImxG
	p/HdbdF/68lV/7c2NTb845LUUaO7ZUFRhvZPQ1Us9+q5nOsn79CFjWcorUYRtyHFcsHz2XbhBOE
	KPhGeoYbV3fhyCLZOW6hFWHZCZ3jO+NM=
X-Gm-Gg: Acq92OHtCszFc4z5l36xuIYBFXAdXov0g5NEV1VaFhAkspnIemQdChR9LmKCj4xhs5z
	82DYv80+ldj2HAJl86OCynrPC6HBbMyFgzJWzvHukY3RHFsiPckZMLmhNsx73Lc6GbprosnN2no
	3KfArxlX4ETbxcFtyS/Lz/ULlGotpoDI9o67HbkQuyr+1jjlh8pTDLYrbBSJlfo914mDGdeOemP
	tIn0wSa5SY1wlvzPVWEeb5qmtOWhjtNngUzI0+ikOLpTA7d9nHrgB7VZ129pTgQbP1a2obiDt/T
	a1vdy6hKf9FzGjvB3Toz9cSBiOo=
X-Received: by 2002:a4a:e903:0:b0:694:9e2f:cfac with SMTP id
 006d021491bc7-69d7fcb51b6mr8951696eaf.9.1779837709977; Tue, 26 May 2026
 16:21:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260525201116.407338-2-kacper.kokot.44@gmail.com> <202605261807.YY0PWuhX-lkp@intel.com>
In-Reply-To: <202605261807.YY0PWuhX-lkp@intel.com>
From: Kacper Kokot <kacper.kokot.44@gmail.com>
Date: Wed, 27 May 2026 00:21:38 +0100
X-Gm-Features: AVHnY4IeURuAw-7kug8a-6xqNpmP-8aoIQEcxEzrITr5eMpT52Lzw3oZg7lhaRo
Message-ID: <CAG-Fur7edB8_4iLnP4QWh+K96bGFBgYyfdoy8H7zvqa8NYdyow@mail.gmail.com>
Subject: Re: [PATCH] netfilter: TCPMSS: fix dropped packets when MSS option is unaligned
To: kernel test robot <lkp@intel.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> AFAICS, these issues are not present in real environments as MSS option
> is placed at the beginning of the options block making it aligned by
> default usually.

I agree, I haven't observed it in any real environment and wouldn't expect to.
I found it by reading the code and had to craft a SYN to reproduce. That said
the spec permits unaligned options and the kernel shouldn't silently drop legal
packets just because nobody sends them today. I can note in the v2 commit
message that this is a theoretical fix.

> > I wonder, if we are touching this code, we could use the opportunity
> > to make it use get_unaligned_be16() instead.
>
> gcc and clang convert x[0] << 8 | x[1] (etc) to the appropriate single
> instruction (and maybe byteswap) on cpu that support misaligned accesses.
> So there is little to gain from doing it any other way.

Happy to go with whichever you prefer for v2.

> and, of course, the code works fine because 0x1 != 0 is 1.

Ha - accidentally correct. I'll add the parens in v2 tomorrow.

Also the reproducer I sent with v1 was clunky. Here's a better
one with some results below:

  #!/usr/bin/env python3
  import argparse
  from scapy.all import *

  parser = argparse.ArgumentParser()
  parser.add_argument("target_ip")
  parser.add_argument("target_port", type=int)
  args = parser.parse_args()

  def gen_mss_syn_options(nops=0):
      return nops * [("NOP", None)] + [("MSS", 1460)]

  def syn_check(opts):
      sport = RandShort()
      ip = IP(dst=args.target_ip)
      syn = TCP(sport=sport, dport=args.target_port, flags="S",
seq=1000, options=opts)
      synack = sr1(ip/syn, timeout=1, verbose=False)
      send(ip/TCP(sport=sport, dport=args.target_port, flags="R",
seq=syn.seq+1),
           verbose=False)
      return not not (synack and synack.haslayer(TCP) and
synack[TCP].flags == 0x12)

  for i in range(7):
      n = 5
      ok = sum(syn_check(gen_mss_syn_options(i)) for _ in range(n))
      print(f"{i} nops + mss, {ok}/{n} probes responded")

Before:

  0 nops + mss, 5/5 probes responded
  1 nops + mss, 0/5 probes responded
  2 nops + mss, 5/5 probes responded
  3 nops + mss, 0/5 probes responded
  4 nops + mss, 5/5 probes responded
  5 nops + mss, 0/5 probes responded
  6 nops + mss, 5/5 probes responded

After:

  0 nops + mss, 5/5 probes responded
  1 nops + mss, 5/5 probes responded
  2 nops + mss, 5/5 probes responded
  3 nops + mss, 5/5 probes responded
  4 nops + mss, 5/5 probes responded
  5 nops + mss, 5/5 probes responded
  6 nops + mss, 5/5 probes responded
