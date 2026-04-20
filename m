Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A7239B49C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Apr 2026 10:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776682714; cv=none; b=FaMT+r75glZjupapTe0hsDwE9uAzbyqhxDkiiQ5QKGeOra5TlOSd91xyxIp1BHRU78Wb0BxMsTD3PtmTROA8z6/GU9dfF+YVAMNtWoPzSLdPRot/OGKYhhJH17/ZaQIaZonWT6z7iEEoCEDXtUKNNS2jz4CP+6l0ehqW5+Dp6cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776682714; c=relaxed/simple;
	bh=Z/RqQZ5y6bft4hMqHDaUqfOlQhmbzjC0l1HNhO7nBss=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fkZeews/aDJsSDNokhaco43uwXCqYg2h8n+RtHofYOzs5T57+pwEkp3twWnhzeZ9H4lJf1pyLIzU3OvGBRb8ZqKrkyZa4FQ2OADKu9TeIriZVtQGu4mWBb96U7VjTiEGjhcOGNHx1IZNTLaMZmnM78CGhuPa4f7CRah4ReUsffQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nWan7hqB; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nWan7hqB"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso26563045e9.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Apr 2026 03:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776682711; x=1777287511; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQOWKei7Kltdv3X+USCnxklQ74uXe3yFxWu8Qz5lwVU=;
        b=nWan7hqBC6mQYNv8twCq559BlwtaQyWydOVYL4YfcxDAHZjNPqLAGXtM0C4Vz3DTeD
         Es0DKAcSms60SKguFXi5k0kL/yUkzOxoxWwY1DU4ezYsc5YvAuiIl4h9p1dVSoVgVOlM
         6U0o4kEN5LIiDCIy8AzjadNNngoTgX9HY9WLjrCNj07BYiQoaty26GA7UvAeVs7NUWpz
         FD6LvkHFmeWM7T0dXK3RhJMd5ZN+Ir5UGBuPFWEFX+txftnM46T8L1HyBqLBAP4uuq6S
         bLFEh58FZZCa1acTi6Sk5pBNtnh+x3olcK1aHEN5nup5fkqp2MTfVWCuhhkwO50igCk4
         KICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776682711; x=1777287511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vQOWKei7Kltdv3X+USCnxklQ74uXe3yFxWu8Qz5lwVU=;
        b=gxNMsnpn2w2k1cRUg/mXvOjT4ojGggAz6rQu6qsAU9EY0IDFebeNgozIULrAu4Ic5S
         K82JrHidmZXSUMLGQE8WwpTEllRHJ/AoGMyKblgl9kiaXtjEkzDoXMaANLdkFFI2T+rl
         yYtLvar4FVucB9UMpqBJltGQ1l6Fgo0LyJSZu1WWaAAkpJF/ddx6VnnC1d2fDUZaln62
         xRLpLee0JdM04PGLGgocLUUHWJ4aFfIl40ShFML9/fIkXJZkv/hAlCoToB+6LqdxepM+
         BTc3tdQwL2SuXj6/csVnl4yi7ZI7QW9IBKW3cgu1bzRhf6iIJGWt575tKUH0vATCauMd
         +AgQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ShkGXXbtAHEzx6hSPsLhEsxS4PAj00yvAyDFlYIbCMsSJ1x6wn89KCaOr3GmA6eEGtW5dHSJ5DK8KOKh9@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3qhFGsJvo8LancYdJkAyce9WKlfRR4VhlC5IlZX+M93LpKvm3
	tsVyW9FpMege4FVOqby94oowA9xHv9CsK+wlBsC9yKGjXUkuYSnB9Nxq
X-Gm-Gg: AeBDieveRE6sTQIF64nVUftOAnJQB+4G4bZksXbezH0FUdc3+Ql8skIqlnb3ntqqGxA
	QAwGW3ZSRPYjpj7gJ8Ys8ZCEZFX3XEwLc1j8+JmcoJnnYwaf5y5vTjW6xrJ+NWLat18eJKSI4O2
	kJkvt7J53J8ErJuiuPrNo1To/B0PT6lCoZUXj8HZYRA5Lqi8wPpijh50aOmwABv/6riM1Q+Zx8z
	khhyvXinftkiIAz9RL+JVC3f2gEOFD4EqqKtboeCjj/H5D/6Y91VgClNPMB5vqBjYXTFWp3ieZG
	LKgnsp9b1cIqDLERGWGX3yRN4wOMi99WVZj2wgVuKwajk5QItmVvicN4MA6FMRLob9MXsCkiq8A
	rmio54GA+N+RErp0Ad9Ldp7yIUVmSzUR1OhjyuYwPcX3ApjrwKKobCULSJPvg9oBwzWbdwaEeE4
	tqXbmo4+V4hCSgub3EC2BM+Qd0UK1maoSRw18TNA==
X-Received: by 2002:a05:600c:12d4:b0:489:1f04:96c3 with SMTP id 5b1f17b1804b1-4891f049763mr20239635e9.2.1776682710673;
        Mon, 20 Apr 2026 03:58:30 -0700 (PDT)
Received: from mtardy-friendly-lvh-runner.local ([2600:1900:4010:1a8::])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-488fc1cfbf2sm290929495e9.15.2026.04.20.03.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 03:58:30 -0700 (PDT)
From: Mahe Tardy <mahe.tardy@gmail.com>
To: mahe.tardy@gmail.com
Cc: alexei.starovoitov@gmail.com,
	andrii@kernel.org,
	ast@kernel.org,
	bpf@vger.kernel.org,
	coreteam@netfilter.org,
	daniel@iogearbox.net,
	fw@strlen.de,
	john.fastabend@gmail.com,
	lkp@intel.com,
	martin.lau@linux.dev,
	netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	pablo@netfilter.org
Subject: [PATCH bpf-next v4 1/6] net: move netfilter nf_reject_fill_skb_dst to core ipv4
Date: Mon, 20 Apr 2026 10:58:11 +0000
Message-Id: <20260420105816.72168-2-mahe.tardy@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420105816.72168-1-mahe.tardy@gmail.com>
References: <aI0MkNvWlE4FXMV8@gmail.com>
 <20260420105816.72168-1-mahe.tardy@gmail.com>
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
index f90106f383c5..ec2466fd0bec 100644
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
index fecf6621f679..2290451ed122 100644
--- a/net/ipv4/netfilter/nf_reject_ipv4.c
+++ b/net/ipv4/netfilter/nf_reject_ipv4.c
@@ -252,21 +252,6 @@ static void nf_reject_ip_tcphdr_put(struct sk_buff *nskb, const struct sk_buff *
 	nskb->csum_offset = offsetof(struct tcphdr, check);
 }

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
@@ -279,7 +264,7 @@ void nf_send_reset(struct net *net, struct sock *sk, struct sk_buff *oldskb,
 	if (!oth)
 		return;

-	if (!skb_dst(oldskb) && nf_reject_fill_skb_dst(oldskb) < 0)
+	if (!skb_dst(oldskb) && ip_route_reply_fetch_dst(oldskb) < 0)
 		return;

 	if (skb_rtable(oldskb)->rt_flags & (RTCF_BROADCAST | RTCF_MULTICAST))
@@ -352,7 +337,7 @@ void nf_send_unreach(struct sk_buff *skb_in, int code, int hook)
 	if (iph->frag_off & htons(IP_OFFSET))
 		return;

-	if (!skb_dst(skb_in) && nf_reject_fill_skb_dst(skb_in) < 0)
+	if (!skb_dst(skb_in) && ip_route_reply_fetch_dst(skb_in) < 0)
 		return;

 	if (skb_csum_unnecessary(skb_in) ||
diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index bc1296f0ea69..7091ef936073 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -2945,6 +2945,21 @@ struct rtable *ip_route_output_flow(struct net *net, struct flowi4 *flp4,
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

