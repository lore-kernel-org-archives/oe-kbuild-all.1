Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7A42638BF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Jul 2025 09:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753695846; cv=none; b=L6EIU6WWWlCTiQudcNQYOgrEvQ6vlOMXdQhCQzyb7JSAvudi7j11mzL5FHAPvvCpGQBPwHmfMw+MYbb4akJDe+di7L5M19uhndPHUNlmqQX29ATj/0Pe0CAFmWbKR7RvkHyTwXubRDVmrfeXvpXYLDgUOplOeed7VQhRWFZpen4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753695846; c=relaxed/simple;
	bh=NFOgSnhWffWrZX8FrBFj28AxcRs4yHqlVKQ/Dmxu3T0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UUQjBrnvV0engjg11Uec5pNMxiIwTIEFiyuTxwsxLbuLeJ1fALG1TaGoZV4Mt8sNHNe8QWs88JfhjlzijGLDqrh5OmQgMpkDv9HZeaYO79V3zGviE9yVTvAuX2mYcwn/f1s5ZkBk3dIl02mwCI41TCMaPu3NGA2fsClwML1ycFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NNhTc3xY; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NNhTc3xY"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4537edf2c3cso44079915e9.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Jul 2025 02:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753695842; x=1754300642; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQpbll3w5pfASYo5OCw14NJ6BKOsZ4svkyx7C0I92c8=;
        b=NNhTc3xYKDyhY9yIogIoVEvHVxjA2d/DIRlSCIyEwKhu1lxSduNkSGD4GkVP+DCYxI
         9jq1l1n06bcTtZueC0YpRErR2FXRpGoLf8Sh3H/gutp659IRpHkbTg2MkZvhBoN+IQUQ
         kalAjuMbTYVknoVhizJN2GQknqz9gWBtPZ2uNzIMZOSs2M9kMk5cJJjancYe/QjyLYFX
         dbFfE2zVw//6jqo+Gq5WAIAD42Qx377DpOIbM6IUq4XjSvenlEnaNyMzDqtEyVhxz8mr
         pwKdetgbOMLymI+XYNqd8IHXdY3oGUlcfSrFMolmJdapSvAwy6eSpZOPQTWKAquqbTjN
         7zDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695842; x=1754300642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQpbll3w5pfASYo5OCw14NJ6BKOsZ4svkyx7C0I92c8=;
        b=FfzPm8hV5HtfougtbSnnVCDhI4XlrO5XuaEZPAlgvbRXwcr+nNwIeXmArp+zMitd8F
         +/7TDUBLOqvbym8MpBFq9afiyeE6b6aEk1G5YmkkfdqcMQG6Q0DnFsFHH5hejUX8x//R
         H2088EkVhuFOuEeJ7/4S9iQTMw8+USijLHscK4JLDskwk0uU2gosKZ9eAhYdjaZK4ciy
         X5nCu5aja9qAA0PugtT2lbHoNc/EeYc4s2/3AsSzeYJ+wgafYLTpgCSVBFWakdM0ET7J
         a4mVnSyvINIzJ+9yKoHRkc2XLDpZ7La182WW5Xo118HXnE2owCt2tbAzd+myKRojxHuR
         eDyw==
X-Forwarded-Encrypted: i=1; AJvYcCUdQGNRKhgrwS9f88oSSV4xa/cxgXZaT1ddci9ZiG5IL+0Z46geJkwtcOgBlf4457koVY2OSWxG68LgB+go@lists.linux.dev
X-Gm-Message-State: AOJu0YxrZ5oQFKTMcLSgUS6chfyrIzi/Dlej4taXD9uYFuBXacoYKWxa
	YymaMEWgi1Um8RP/5Q80h+pMh9uW6dBRNwe9k0h7QHSTieirh3ck+FWiDtLIQH8V
X-Gm-Gg: ASbGncsVriJv8deEQ0tZmFEN2EW5bkKPD9KM6Jx0EdsA1E0dLBKQWVP+a7BrmXhpLqj
	njz5kl9rbO00SBrJPAL7g82ldlo/1tvwvD6K2kRCYSuDcU9dv/D8q5EzdFfPFJsrpDpzXt6Oo2y
	uA0r+qiNr6o50bU+OepAtiX7TS/CLRbeWrtnlHg0Z+GA7dfD6XJ5be0J0AiPiPwopKK28KVZrle
	utsd/ur5V0lPkF6GEItXSHDcU+IKhKE0mzrBElggAWEXzSW87fu86uO/xSDMS0cqBmQId9rY6eO
	1KpM30MCK8P+CWaS1wZQi6EnaMetjg2wBWR+QgTrlS2f9fvWBJYt/jmX8gjjgrhV5QssXekBVXT
	xBOrwHnV7z6qRlIutI2/UoTfnMKcux0gQpNFg7DWFRcPdp6eX
X-Google-Smtp-Source: AGHT+IG7zoWXd3OhLpG3IH76xQg5CAOEMoO/I41EqW5cLVt/mpUHo/XgN6ZnZgHSxF7JODuJNO8BfA==
X-Received: by 2002:a05:600c:a0c:b0:456:1923:7549 with SMTP id 5b1f17b1804b1-4587655b790mr81378335e9.26.1753695841875;
        Mon, 28 Jul 2025 02:44:01 -0700 (PDT)
Received: from mtardy-friendly-lvh-runner.c.cilium-dev.internal ([2600:1900:4010:1a8::])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-458705bcbfbsm153422725e9.16.2025.07.28.02.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:44:00 -0700 (PDT)
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
Subject: [PATCH bpf-next v3 1/4] net: move netfilter nf_reject_fill_skb_dst to core ipv4
Date: Mon, 28 Jul 2025 09:43:42 +0000
Message-Id: <20250728094345.46132-2-mahe.tardy@gmail.com>
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

Move and rename nf_reject_fill_skb_dst from
ipv4/netfilter/nf_reject_ipv4 to ip_route_reply_fetch_dst in
ipv4/route.c so that it can be reused in the following patches by BPF
kfuncs.

Netfilter uses nf_ip_route that is almost a transparent wrapper around
ip_route_output_key so this patch inlines it.

Signed-off-by: Mahe Tardy <mahe.tardy@gmail.com>
---
 include/net/route.h                 |  1 +
 net/ipv4/netfilter/nf_reject_ipv4.c | 19 ++-----------------
 net/ipv4/route.c                    | 15 +++++++++++++++
 3 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/include/net/route.h b/include/net/route.h
index 8e39aa822cf9..1f032f768d52 100644
--- a/include/net/route.h
+++ b/include/net/route.h
@@ -173,6 +173,7 @@ struct rtable *ip_route_output_flow(struct net *, struct flowi4 *flp,
 				    const struct sock *sk);
 struct dst_entry *ipv4_blackhole_route(struct net *net,
 				       struct dst_entry *dst_orig);
+int ip_route_reply_fetch_dst(struct sk_buff *skb);

 static inline struct rtable *ip_route_output_key(struct net *net, struct flowi4 *flp)
 {
diff --git a/net/ipv4/netfilter/nf_reject_ipv4.c b/net/ipv4/netfilter/nf_reject_ipv4.c
index 87fd945a0d27..76beb78f556a 100644
--- a/net/ipv4/netfilter/nf_reject_ipv4.c
+++ b/net/ipv4/netfilter/nf_reject_ipv4.c
@@ -220,21 +220,6 @@ void nf_reject_ip_tcphdr_put(struct sk_buff *nskb, const struct sk_buff *oldskb,
 }
 EXPORT_SYMBOL_GPL(nf_reject_ip_tcphdr_put);

-static int nf_reject_fill_skb_dst(struct sk_buff *skb_in)
-{
-	struct dst_entry *dst = NULL;
-	struct flowi fl;
-
-	memset(&fl, 0, sizeof(struct flowi));
-	fl.u.ip4.daddr = ip_hdr(skb_in)->saddr;
-	nf_ip_route(dev_net(skb_in->dev), &dst, &fl, false);
-	if (!dst)
-		return -1;
-
-	skb_dst_set(skb_in, dst);
-	return 0;
-}
-
 /* Send RST reply */
 void nf_send_reset(struct net *net, struct sock *sk, struct sk_buff *oldskb,
 		   int hook)
@@ -248,7 +233,7 @@ void nf_send_reset(struct net *net, struct sock *sk, struct sk_buff *oldskb,
 		return;

 	if ((hook == NF_INET_PRE_ROUTING || hook == NF_INET_INGRESS) &&
-	    nf_reject_fill_skb_dst(oldskb) < 0)
+	    ip_route_reply_fetch_dst(oldskb) < 0)
 		return;

 	if (skb_rtable(oldskb)->rt_flags & (RTCF_BROADCAST | RTCF_MULTICAST))
@@ -322,7 +307,7 @@ void nf_send_unreach(struct sk_buff *skb_in, int code, int hook)
 		return;

 	if ((hook == NF_INET_PRE_ROUTING || hook == NF_INET_INGRESS) &&
-	    nf_reject_fill_skb_dst(skb_in) < 0)
+	    ip_route_reply_fetch_dst(skb_in) < 0)
 		return;

 	if (skb_csum_unnecessary(skb_in) ||
diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index fccb05fb3a79..59b8fc3c01c0 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -2934,6 +2934,21 @@ struct rtable *ip_route_output_flow(struct net *net, struct flowi4 *flp4,
 }
 EXPORT_SYMBOL_GPL(ip_route_output_flow);

+int ip_route_reply_fetch_dst(struct sk_buff *skb)
+{
+	struct rtable *rt;
+	struct flowi4 fl4 = {
+		.daddr = ip_hdr(skb)->saddr
+	};
+
+	rt = ip_route_output_key(dev_net(skb->dev), &fl4);
+	if (IS_ERR(rt))
+		return PTR_ERR(rt);
+	skb_dst_set(skb, &rt->dst);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(ip_route_reply_fetch_dst);
+
 /* called with rcu_read_lock held */
 static int rt_fill_info(struct net *net, __be32 dst, __be32 src,
 			struct rtable *rt, u32 table_id, dscp_t dscp,
--
2.34.1

