Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190D3263F5D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Jul 2025 09:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753695847; cv=none; b=ZXZY6QtjdECxsDqCmci0UXQ6HVSxgsDEuLPrs/Q6JOeEV/dRNhZzZ4mqsLjEf21DUR0edNkVb1aq+SVrtI3x+9apZllLxipb9azUj3kskfjNMcI7Tz+susR+XH6zUfsfisWMGB5sQb7iLjX4wRyqAMiJm+AExxQihu3d3De+Vzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753695847; c=relaxed/simple;
	bh=qVSRdBW5BWeBb2K0uA4KJ7uaKd1bWg9Klyw/AQcWoNE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BWgQafzExmLR2l9INO6wCGjEF/O/D4FHHOZEmL32RHmafQee89y4HPBDhW1y2XkCjRh/mxW//E6cIPWegWEHSIdWUJxGYKhg/Ia3lNBl0dpRtSL+2x0aH3XQ8jjVxPQV/zrYlULixyeRtU4pKIeJPgeEBsHtNMyf3hPLmMqb2SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C3ncBobS; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C3ncBobS"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4561ed868b5so27194015e9.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Jul 2025 02:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753695843; x=1754300643; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1dsLivZusM5yDXPBZGoVZ6iRqMndovj0MlJwHvinT8=;
        b=C3ncBobSwfVJt+V4CyhztyEI01m/r1DpssXXhGmFSgcy+Ao92E64T/mKCzNKPWHdtw
         Q7m07o/xXJMbt3oa5GnIsj1q+zEaCkLac156CGd2YadKNDCmQpEDyAfJOZRKD/TXUKni
         VzTUrSPF2H6O5p3faI1ysHvZWJC2osUPrlF52WV/4w9lyqJGSE4JfLmEmA6Yloi5yy0o
         G1aTAUSvLWtOBW+wctC8E3xmFx7K2wZJxYCFo4kKJ5WXHGgR9I1kzRKF8PsjS1azzAoS
         JTuxsULX/8QvVkUJh9b1cy4NUOS4soeyRdgHDRbWRbO5xYZ/dvZuYrLNJsxVfrt0XLeR
         tWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695843; x=1754300643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T1dsLivZusM5yDXPBZGoVZ6iRqMndovj0MlJwHvinT8=;
        b=fVUlXzGYmOPJcFzk951WQ0L704/jUkU5B1gZQPVxvxAhY0In4rbKkQhqmNdaRfLUpG
         G8a7Uf7yG2QWlGja1a2iC7Hc/cqQiQLIS5ox5cd5M4oviaZH/dVSjzUSWIBwO5HG7h+N
         6bDRVPOOJ/WHdrDEk61fILEdpT/rvvfBROuQnyRvO2FmHN9epFiO7lesrDdGtslHZvmu
         jxp389X+sSY3cWruhQjc/CEzjGbux5qBqgSzyYPqqImKX3syrPd+sQbaaYh1eCRBrmH0
         0dALvcbwvm+Ff5zaUOLvbXWttDt2igdXCbY8ZRhOgUktmKvO/mjtfb5b8PHquGU58Scc
         9leA==
X-Forwarded-Encrypted: i=1; AJvYcCX1YdG7vz6GmxInSvtxMQylUnG91wCQ2yeyhKO00L4zUc3W2f6X3FEmR/DTNJg+bECt/52l1c2eviCSnwvj@lists.linux.dev
X-Gm-Message-State: AOJu0YydCxjU5zExdOV5hG96VkBHHGz3mxYWWefvtrEwnlmMdXdUkbhZ
	o8DhGrUgEj4RzepUnzL036c2ONifVev/Hau88zQ1Jk2D4E1hc0sf6SkB
X-Gm-Gg: ASbGncsO99Za71ESYZm5gXGQ/IL/S5xtk9RSW9r7fNExWXpKRxVdbqe4nvi8buIoYxV
	bibxNZSumLvvDP6e8b7aHn7FZT5wJ2t3w8oRL+0c9AaT8aZL1QjvtQvZ1jtCi0EFbb++t8hdbID
	iRvHBJHGgvUap/4lQgP59UbVfhmlU3mS4kM67+eRzwYaSdQ1s+1o9aZnTWijH8YZgM64xL9hRfV
	kI4meR6dt7n0EAHomtWVTue16JteTvQbwQwb48nzSfOJjIQDvJ7Tf0iuvckU5vwUrLbIn6r67jU
	XYwHqaZQ/wNjhoY1y88G2RwrceuGgaQcMbpdQfMw1gN5tVvZLVYJnqLanyVTyOzkGUFEbDlCojp
	WsNhjurh6dpgs5FV1waWbY9UtWru3dwb3r1kGVt94OPHQmJEZLHx+15p6xj8=
X-Google-Smtp-Source: AGHT+IGJciwZb68b0g2bprFe7Mmy3ICoCqA/L9fq9pjV/9mkZTTrJECq+h8er0WQOsyg7A4Plql44g==
X-Received: by 2002:a05:600c:4f87:b0:456:133f:a02d with SMTP id 5b1f17b1804b1-4587644278emr105559855e9.17.1753695843189;
        Mon, 28 Jul 2025 02:44:03 -0700 (PDT)
Received: from mtardy-friendly-lvh-runner.c.cilium-dev.internal ([2600:1900:4010:1a8::])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-458705bcbfbsm153422725e9.16.2025.07.28.02.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:44:02 -0700 (PDT)
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
Subject: [PATCH bpf-next v3 2/4] net: move netfilter nf_reject6_fill_skb_dst to core ipv6
Date: Mon, 28 Jul 2025 09:43:43 +0000
Message-Id: <20250728094345.46132-3-mahe.tardy@gmail.com>
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

Move and rename nf_reject6_fill_skb_dst from
ipv6/netfilter/nf_reject_ipv6 to ip6_route_reply_fetch_dst in
ipv6/route.c so that it can be reused in the following patches by BPF
kfuncs.

Netfilter uses nf_ip6_route that is almost a transparent wrapper around
ip6_route_outputy so this patch inlines it.

Signed-off-by: Mahe Tardy <mahe.tardy@gmail.com>
---
 include/net/ip6_route.h             |  2 ++
 net/ipv6/netfilter/nf_reject_ipv6.c | 17 +----------------
 net/ipv6/route.c                    | 18 ++++++++++++++++++
 3 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/include/net/ip6_route.h b/include/net/ip6_route.h
index 6dbdf60b342f..1426467df547 100644
--- a/include/net/ip6_route.h
+++ b/include/net/ip6_route.h
@@ -93,6 +93,8 @@ static inline struct dst_entry *ip6_route_output(struct net *net,
 	return ip6_route_output_flags(net, sk, fl6, 0);
 }

+int ip6_route_reply_fetch_dst(struct sk_buff *skb);
+
 /* Only conditionally release dst if flags indicates
  * !RT6_LOOKUP_F_DST_NOREF or dst is in uncached_list.
  */
diff --git a/net/ipv6/netfilter/nf_reject_ipv6.c b/net/ipv6/netfilter/nf_reject_ipv6.c
index 9ae2b2725bf9..994a3b88ac52 100644
--- a/net/ipv6/netfilter/nf_reject_ipv6.c
+++ b/net/ipv6/netfilter/nf_reject_ipv6.c
@@ -250,21 +250,6 @@ void nf_reject_ip6_tcphdr_put(struct sk_buff *nskb,
 }
 EXPORT_SYMBOL_GPL(nf_reject_ip6_tcphdr_put);

-static int nf_reject6_fill_skb_dst(struct sk_buff *skb_in)
-{
-	struct dst_entry *dst = NULL;
-	struct flowi fl;
-
-	memset(&fl, 0, sizeof(struct flowi));
-	fl.u.ip6.daddr = ipv6_hdr(skb_in)->saddr;
-	nf_ip6_route(dev_net(skb_in->dev), &dst, &fl, false);
-	if (!dst)
-		return -1;
-
-	skb_dst_set(skb_in, dst);
-	return 0;
-}
-
 void nf_send_reset6(struct net *net, struct sock *sk, struct sk_buff *oldskb,
 		    int hook)
 {
@@ -398,7 +383,7 @@ void nf_send_unreach6(struct net *net, struct sk_buff *skb_in,
 		skb_in->dev = net->loopback_dev;

 	if ((hooknum == NF_INET_PRE_ROUTING || hooknum == NF_INET_INGRESS) &&
-	    nf_reject6_fill_skb_dst(skb_in) < 0)
+	    ip6_route_reply_fetch_dst(skb_in) < 0)
 		return;

 	icmpv6_send(skb_in, ICMPV6_DEST_UNREACH, code, 0);
diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 0d5464c64965..de61540f9524 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -2705,6 +2705,24 @@ struct dst_entry *ip6_route_output_flags(struct net *net,
 }
 EXPORT_SYMBOL_GPL(ip6_route_output_flags);

+int ip6_route_reply_fetch_dst(struct sk_buff *skb)
+{
+	struct dst_entry *result;
+	struct flowi6 fl = {
+		.daddr = ipv6_hdr(skb)->saddr
+	};
+	int err;
+
+	result = ip6_route_output(dev_net(skb->dev), NULL, &fl);
+	err = result->error;
+	if (err)
+		dst_release(result);
+	else
+		skb_dst_set(skb, result);
+	return err;
+}
+EXPORT_SYMBOL_GPL(ip6_route_reply_fetch_dst);
+
 struct dst_entry *ip6_blackhole_route(struct net *net, struct dst_entry *dst_orig)
 {
 	struct rt6_info *rt, *ort = dst_rt6_info(dst_orig);
--
2.34.1

