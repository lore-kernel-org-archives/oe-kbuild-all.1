Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AD2264624
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Jul 2025 09:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753695848; cv=none; b=oBfIECKaBELhhTRBg7t+e9RqGU9VgbrrydV+R9izvEGFLoAD4T0YVRZMfW9ETMcNYEUSF1rbHFaipY22OzW+obkKmEZ8mhezwM/ZVEdDmcTYeE24cGV/tUPge82w6U2v/ratDMiBKGRduMbC0gQ0LeKtuTUpZikKIR0bgTwORck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753695848; c=relaxed/simple;
	bh=8WV+cWhcfM9K9VU9HUEfZN7gptZm+lCmHHT/GLpr/Vg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LC4f22Jr1Wlv4XM92C8S0Yr51In+xeUssbW2R0hqdMc5w2o5P6lGca5UQFGYvsC1XQkCWR6t97WNXxrpcTQ25wSYCr3ucctGBdfPiczGgxww5ImOpuUPpvTZsq6UJYdSDfc0hQpL3fIiDoGywydq3JEKRN2zuQJglCDSi3wXjg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nFoZ/y2c; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nFoZ/y2c"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b78127c5d1so983480f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Jul 2025 02:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753695844; x=1754300644; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFp2I4omjYRuFO7iuM5mH+nPGTxW4G7hOZbPaKnkEMg=;
        b=nFoZ/y2cqFrGGSMUDkczvT1S3o0mCMHA/a0STJL2+oM1gkY0d+5ZFHgzSY1otdgXCJ
         5ZCM8HM+E1JWOnk41DX8pTZzVXMWAhcpnBxYaboDnBkREBbnDoCizPDgJWebg7VA8y0l
         bjER9BO5Pt6SzBzBo87wr8CeR/+knE29EOGsr2uMajDZxbcn4c9010nV28fIpi9pJxjK
         NmfuJ130/0RgLSDvPbtYhsg+3gz5+5/ZcFOm5lb8tPbm0ZgNBDQuU71xiyQCsCwZ0SXe
         JrTWRbM8ZzvXxAdGmfcHlnDAKdf1btkMcg6KXdAcoEgJWFovPT7BPWuBoQHCHJ0WeQky
         Efzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695844; x=1754300644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFp2I4omjYRuFO7iuM5mH+nPGTxW4G7hOZbPaKnkEMg=;
        b=I5w6+nvdSjgRVdHTm8E3ragwXCAtK+xcbDjhgF5d33AfS2twK3imLEKTxhbymsRiHc
         cijzca6kMvvmpSaoIFjU84nW2ws6VLcRjYjc5diJTsdRhEOCCHU1HlK+9PTrDbgpYYTw
         1RAJnDejg1sVVwclzsH/OnoIhtWP+RdktTvkjPh5AmdsAB5tMc5qmyNi+5oAe1qEjRTs
         GjwZkrzRW7c1b7peP93X272jQpxPZ825jovJeunYy0d97ydnsGMOUqfZeRXjWRj1c4UQ
         6Ez7FWbJP7BKhNi0e6r5WJZkb9vDaUk2O3ph+Q3vLg5Rf0ZAqXxvSUE6Zh9s+MxLPcBg
         0XpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWq+iche671GhyysUBj1615r4zjxjp82bTqewP5y9plnbk/CWuKrd4IVsCg1HcmUFn+mgP4VvDJBei/AKxZ@lists.linux.dev
X-Gm-Message-State: AOJu0YzARnHhLbW1ombMWd4fh0iYItojN3ym6vFzaWEiD0IVhHpHnQub
	zFlUsfSKRYjkvQ0Vd1yRaTJTnGMRuKl3fsnp4pnQy232BKyDXa44mqKm
X-Gm-Gg: ASbGncvlJIqc8FcroN+uwAP38aIiTa0Bi1+4CJ3zHWRy88P81vNIJj5qCXB06q7t5Bx
	6SZd6nPXS99jh8RuzDmUNrc6l3HG+4p4Rx8O3305AObU2P3fps5nOhDSg7uzEEkA2esplJ4ceEu
	71Ju7qZEk9xv/wm10rJ5JmUPFMjFaPN7Osl+vbxuPTdlfzNu7469Ndk8a6qOsvcmabVABIvVlU8
	dOFVKtNH2UiCe3bNmYeeR0zeW1fdcZ2YbpYA+QGzv+nmWEcoNLfdM55VHCibGTXA5K4sacXWrex
	Pgd5/JV1+UOXUk2Tc0CeqsuTipX432FSwsRJ0fclIrvxyxnjIEh7pxJuJJSGAUV+j2ch7F7evpL
	TrIanEITrH+YsX5CtTIJAuegoxMetD6Db1Y1kSYIm1biaLp4N
X-Google-Smtp-Source: AGHT+IEtfYZlLiEHEr689fId7m8sq3LHQPfHzZXeAGEPX5MzGQc1Xmo+EoG2SrcnCHk8UfuIAB651g==
X-Received: by 2002:a5d:588f:0:b0:3a4:f902:3872 with SMTP id ffacd0b85a97d-3b7765ee46cmr7119141f8f.19.1753695844135;
        Mon, 28 Jul 2025 02:44:04 -0700 (PDT)
Received: from mtardy-friendly-lvh-runner.c.cilium-dev.internal ([2600:1900:4010:1a8::])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-458705bcbfbsm153422725e9.16.2025.07.28.02.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:44:03 -0700 (PDT)
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
Subject: [PATCH bpf-next v3 3/4] bpf: add bpf_icmp_send_unreach cgroup_skb kfunc
Date: Mon, 28 Jul 2025 09:43:44 +0000
Message-Id: <20250728094345.46132-4-mahe.tardy@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250728094345.46132-1-mahe.tardy@gmail.com>
References: <202507270940.kXGmRbg5-lkp@intel.com>
 <20250728094345.46132-1-mahe.tardy@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is needed in the context of Tetragon to provide improved feedback
(in contrast to just dropping packets) to east-west traffic when blocked
by policies using cgroup_skb programs.

This reuse concepts from netfilter reject target codepath with the
differences that:
* Packets are cloned since the BPF user can still return SK_PASS from
  the cgroup_skb progs and the current skb need to stay untouched
  (cgroup_skb hooks only allow read-only skb payload).
* Since cgroup_skb programs are called late in the stack, checksums do
  not need to be computed or verified, and IPv4 fragmentation does not
  need to be checked (ip_local_deliver should take care of that
  earlier).

Signed-off-by: Mahe Tardy <mahe.tardy@gmail.com>
---
 net/core/filter.c | 61 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/net/core/filter.c b/net/core/filter.c
index 7a72f766aacf..050872324575 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -85,6 +85,10 @@
 #include <linux/un.h>
 #include <net/xdp_sock_drv.h>
 #include <net/inet_dscp.h>
+#include <linux/icmp.h>
+#include <net/icmp.h>
+#include <net/route.h>
+#include <net/ip6_route.h>

 #include "dev.h"

@@ -12148,6 +12152,53 @@ __bpf_kfunc int bpf_sock_ops_enable_tx_tstamp(struct bpf_sock_ops_kern *skops,
 	return 0;
 }

+__bpf_kfunc int bpf_icmp_send_unreach(struct __sk_buff *__skb, int code)
+{
+	struct sk_buff *skb = (struct sk_buff *)__skb;
+	struct sk_buff *nskb;
+
+	switch (skb->protocol) {
+	case htons(ETH_P_IP):
+		if (code < 0 || code > NR_ICMP_UNREACH)
+			return -EINVAL;
+
+		nskb = skb_clone(skb, GFP_ATOMIC);
+		if (!nskb)
+			return -ENOMEM;
+
+		if (ip_route_reply_fetch_dst(nskb) < 0) {
+			kfree_skb(nskb);
+			return -EHOSTUNREACH;
+		}
+
+		icmp_send(nskb, ICMP_DEST_UNREACH, code, 0);
+		kfree_skb(nskb);
+		break;
+#if IS_ENABLED(CONFIG_IPV6)
+	case htons(ETH_P_IPV6):
+		if (code < 0 || code > ICMPV6_REJECT_ROUTE)
+			return -EINVAL;
+
+		nskb = skb_clone(skb, GFP_ATOMIC);
+		if (!nskb)
+			return -ENOMEM;
+
+		if (ip6_route_reply_fetch_dst(nskb) < 0) {
+			kfree_skb(nskb);
+			return -EHOSTUNREACH;
+		}
+
+		icmpv6_send(nskb, ICMPV6_DEST_UNREACH, code, 0);
+		kfree_skb(nskb);
+		break;
+#endif
+	default:
+		return -EPROTONOSUPPORT;
+	}
+
+	return SK_DROP;
+}
+
 __bpf_kfunc_end_defs();

 int bpf_dynptr_from_skb_rdonly(struct __sk_buff *skb, u64 flags,
@@ -12185,6 +12236,10 @@ BTF_KFUNCS_START(bpf_kfunc_check_set_sock_ops)
 BTF_ID_FLAGS(func, bpf_sock_ops_enable_tx_tstamp, KF_TRUSTED_ARGS)
 BTF_KFUNCS_END(bpf_kfunc_check_set_sock_ops)

+BTF_KFUNCS_START(bpf_kfunc_check_set_icmp_send_unreach)
+BTF_ID_FLAGS(func, bpf_icmp_send_unreach, KF_TRUSTED_ARGS)
+BTF_KFUNCS_END(bpf_kfunc_check_set_icmp_send_unreach)
+
 static const struct btf_kfunc_id_set bpf_kfunc_set_skb = {
 	.owner = THIS_MODULE,
 	.set = &bpf_kfunc_check_set_skb,
@@ -12210,6 +12265,11 @@ static const struct btf_kfunc_id_set bpf_kfunc_set_sock_ops = {
 	.set = &bpf_kfunc_check_set_sock_ops,
 };

+static const struct btf_kfunc_id_set bpf_kfunc_set_icmp_send_unreach = {
+	.owner = THIS_MODULE,
+	.set = &bpf_kfunc_check_set_icmp_send_unreach,
+};
+
 static int __init bpf_kfunc_init(void)
 {
 	int ret;
@@ -12229,6 +12289,7 @@ static int __init bpf_kfunc_init(void)
 	ret = ret ?: register_btf_kfunc_id_set(BPF_PROG_TYPE_CGROUP_SOCK_ADDR,
 					       &bpf_kfunc_set_sock_addr);
 	ret = ret ?: register_btf_kfunc_id_set(BPF_PROG_TYPE_SCHED_CLS, &bpf_kfunc_set_tcp_reqsk);
+	ret = ret ?: register_btf_kfunc_id_set(BPF_PROG_TYPE_CGROUP_SKB, &bpf_kfunc_set_icmp_send_unreach);
 	return ret ?: register_btf_kfunc_id_set(BPF_PROG_TYPE_SOCK_OPS, &bpf_kfunc_set_sock_ops);
 }
 late_initcall(bpf_kfunc_init);
--
2.34.1

