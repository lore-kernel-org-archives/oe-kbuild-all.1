Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83002257AF3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Jul 2025 09:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753695844; cv=none; b=oF54GSlI71/Jh9nqvAf88pRgyju1DLAxzfJOMGtWgbSSD4EQE6IkjeC4FIImY2D2xrmCVTvJg6IhqzHUp3ce15tat2p/YqAPXnDDfMZz5IF/UhZr3iobi181v0a/Wk+aQPoOx3FdH1yb0WFQbOEHzg5mL4Vvhzy3ece4jr3oAzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753695844; c=relaxed/simple;
	bh=QwvRXzFZogKebxw5m6w84tCyPvrj+Mj2jXrz70Fx9zU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JlrwaKEiH3j/8noVb+cjyQfWrL1WbnRBzYrIMoSCOmOSi1RbRJINoZ6cvvv1qrxihhc6OPStaYpsdnn6pf6yKbmXkCmRh19g4PNmodas5Lz2OV11uvikJe/04/NDSrbKfgbTvO3FwKbCKD+yu/YzHFx0c/IQIb+9xGALinzeNI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HEV3beEu; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HEV3beEu"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45619d70c72so37892945e9.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Jul 2025 02:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753695841; x=1754300641; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpZDkIwSNXAkfznm1ocUN63CgTKXhTTLgm3bOfdy+mQ=;
        b=HEV3beEuPoJ7idREB2xG3Dqx14OHQLqGT/ad+E7ipzMdn1Zcb5afh4ZtUjQja4RT/N
         aYVP4BXjC4Rg/j0hncVVfMPGKhQDvXj5E2aKBNTWvvj4dW0dBhrb0t1Yk6DegcUOvvP4
         NJm14Yc2K1etPHn1ctXNott0oFViXB0z3NDPB9f65bBS5OhxnIi86+RjcXgNecnfJbpW
         WFwYW4kfk/SC+Ui18A+H/dYdWEyYLHVjNHhfszMv9zvqhyl2REy4O+5LgMd9cL4Lzyhq
         LRnK3CKl/lKFZ4bQfr0NlHeWql4LMKiz3IfUmrPZAAVy9bcPABiwTnR8owE8yz7AtIFO
         prUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695841; x=1754300641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DpZDkIwSNXAkfznm1ocUN63CgTKXhTTLgm3bOfdy+mQ=;
        b=H9rmVAiouYvH3UknpUEBnDQPJf6VPfn5CGJYj2tMMImxyZvUT3WCXRMoVDhUmPQke3
         pnzPgVB/+8/16FAZEYmYEIHbTED58yUCNs6yEAZpcJQosDY9DWlade3nlWcBP7V7eztH
         Z3jHF2Bid4/yiVapADwv8tcjAMyOOBOoWciDsCt1cp0itfYJUzBAqCFZ480+qhBze+he
         a8dj3Yx03yIX+/XP5Vowm5M0YvxGvP2ru9+7b56BQlLy7h6Fhat2FPQXNwYbyOevJyEw
         6HMug233/EUCy+uIucWuupMN8BWJ6Aku6afYf8NNs69hCLpCBKj+sI5Fdv8c7XIQjywI
         dpxw==
X-Forwarded-Encrypted: i=1; AJvYcCWfBfL7FtGaI+RDfcZbxpcY0HiFZdA/3bjrnAgQEMMMXaQ+8X4/ZooDy/vCp7UKrsT9907tqBGt3rJeuXZC@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2k5Wpltcdx9zdSOAg1bgCUxbg1WoPmuUO/kVcZeThJ+4myMhZ
	yMBDpsleg0R4w/WxKWz0N9/zW4tTN4wzic7t/xqX75XfcIGC+H1ihfKp
X-Gm-Gg: ASbGncsXFI6acEFyFn5HLNP+vwvFM2qSrux1dfR2R+Csefp4d4yergoM59ke8301FVa
	nzMAS3HjEDwfzYcLlmN+PGXEe7ktM+vtFUEdPxvX8Sop+gvaqBJkM+M/KBKJFbxmS3nbcFaR5U4
	LQNmVp4MOqK9vbA2sWeyX6kbAyURoxxordSLCp98y5mwe7ckPP0bv0wMFHIkt2dwSVbiVuqkLVu
	m084XB++B3VrgJgToxveosKsJrKWdmJDV908p9Aiw+1XV8MwDW7OHQtJN8IIu4x8Ppqy5PimFJ1
	48s3Q1x7iazD63gX6aPANaHYt2k0JM9QjJ2B5hLn8+STT4Ftg4Z5ruPWZ3T42c4eSN7IlbDQr8b
	/hcRm44drDIKVKD/1v62T3bl7VCXL5N4MKrvNzyp4eO/LukmmfCI45lqCRq8=
X-Google-Smtp-Source: AGHT+IG5YcJv7gRPiLUXWoPYJT12uySQOIVS9lPTpxptOjBAj2UVXqoD1tWPU/3FVsEas2UhJ6xBsQ==
X-Received: by 2002:a05:600c:8882:b0:456:1146:5c01 with SMTP id 5b1f17b1804b1-458705801acmr86122455e9.12.1753695840650;
        Mon, 28 Jul 2025 02:44:00 -0700 (PDT)
Received: from mtardy-friendly-lvh-runner.c.cilium-dev.internal ([2600:1900:4010:1a8::])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-458705bcbfbsm153422725e9.16.2025.07.28.02.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:43:59 -0700 (PDT)
From: Mahe Tardy <mahe.tardy@gmail.com>
To: lkp@intel.com
Cc: alexei.starovoitov@gmail.com,
	andrii@kernel.org,
	ast@kernel.org,
	bpf@vger.kernel.org,
	coreteam@netfilter.org,
	daniel@iogearbox.net,
	fw@strlen.de,
	john.fastabend@gmail.com,
	mahe.tardy@gmail.com,
	martin.lau@linux.dev,
	netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	pablo@netfilter.org
Subject: [PATCH bpf-next v3 0/4] bpf: add icmp_send_unreach kfunc
Date: Mon, 28 Jul 2025 09:43:41 +0000
Message-Id: <20250728094345.46132-1-mahe.tardy@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <202507270940.kXGmRbg5-lkp@intel.com>
References: <202507270940.kXGmRbg5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This is v3 of adding the icmp_send_unreach kfunc, as suggested during
LSF/MM/BPF 2025[^1]. The goal is to allow cgroup_skb programs to
actively reject east-west traffic, similarly to what is possible to do
with netfilter reject target.

The first step to implement this is using ICMP control messages, with
the ICMP_DEST_UNREACH type with various code ICMP_NET_UNREACH,
ICMP_HOST_UNREACH, ICMP_PROT_UNREACH, etc. This is easier to implement
than a TCP RST reply and will already hint the client TCP stack to abort
the connection and not retry extensively.

Note that this is different than the sock_destroy kfunc, that along
calls tcp_abort and thus sends a reset, destroying the underlying
socket.

Caveats of this kfunc design are that a cgroup_skb program can call this
function N times, thus send N ICMP unreach control messages and that the
program can return from the BPF filter with SK_PASS leading to a
potential confusing situation where the TCP connection was established
while the client received ICMP_DEST_UNREACH messages.

Another more sophisticated design idea would be for the kfunc to set the
kernel to send an ICMP_HOST_UNREACH control message with the appropriate
code when the cgroup_skb program terminates with SK_DROP. Creating a new
'SK_REJECT' return code for cgroup_skb program was generally rejected
and would be too limited for other program types support.

We should bear in mind that we want to add a TCP reset kfunc next and
also could extend this kfunc to other program types if wanted.

v2 updates:
- fix a build error from a missing function call rename;
- avoid changing return line in bpf_kfunc_init;
- return SK_DROP from the kfunc (similarly to bpf_redirect);
- check the return value in the selftest.

v3 update:
- fix an undefined reference build error.

[^1]: https://lwn.net/Articles/1022034/

Mahe Tardy (4):
  net: move netfilter nf_reject_fill_skb_dst to core ipv4
  net: move netfilter nf_reject6_fill_skb_dst to core ipv6
  bpf: add bpf_icmp_send_unreach cgroup_skb kfunc
  selftests/bpf: add icmp_send_unreach kfunc tests

 include/net/ip6_route.h                       |  2 +
 include/net/route.h                           |  1 +
 net/core/filter.c                             | 61 ++++++++++++
 net/ipv4/netfilter/nf_reject_ipv4.c           | 19 +---
 net/ipv4/route.c                              | 15 +++
 net/ipv6/netfilter/nf_reject_ipv6.c           | 17 +---
 net/ipv6/route.c                              | 18 ++++
 .../bpf/prog_tests/icmp_send_unreach_kfunc.c  | 99 +++++++++++++++++++
 .../selftests/bpf/progs/icmp_send_unreach.c   | 36 +++++++
 9 files changed, 235 insertions(+), 33 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/icmp_send_unreach_kfunc.c
 create mode 100644 tools/testing/selftests/bpf/progs/icmp_send_unreach.c

--
2.34.1

