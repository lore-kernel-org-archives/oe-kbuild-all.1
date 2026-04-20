Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E049D39B4BC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Apr 2026 10:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776682714; cv=none; b=tZUmCJlDSyv1KKtUSh7xkneukvSlJkcWrwiAXaStUOY1aPQOkjxEZVQ+HX0Dz0cnYaZcX1E71VBL4E7FgDzujeqoM0X4hI7SfNAcENCVVCtxRemr76Is2+bU8ueYHgCkzVjGLdvwsVMofHBEDrsVzbApFEjMwCL9J/deksJMvok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776682714; c=relaxed/simple;
	bh=eM+kBof0ulZSr5/cYF9WFtvW3e7WM/D2dX633xCjEDo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d27xnxmlcm9WEgiFCOjk/pKvsTcUKzc7Ig1AT6HJK6N5t0tt2LmGlf6QrlFKiXqwrJdfc0sjTJTNjnxXNZvwP/lDI8y1h92uO1jYk0wur044CUgfy2O//vxWIYSjfB7wFH44ORtAhgpLj+vqlbM/bJ4UM15xd12LExjdIYsctnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmdy84Ia; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmdy84Ia"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4891b0786beso8231265e9.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Apr 2026 03:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776682711; x=1777287511; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIn4y25U9iTbZ6u0/nqOP41USOI/jaT9h/eIclbE8HQ=;
        b=bmdy84IaEEb+FZw0y3izHDuNzLMOJPckx+rGzVL9Bpw1Hc27VCi5Qu7nQlJi74/zG4
         U/mWS6cVKxkUoLZoHUr1pLIzq/EHJ3vAVQ4l6wC1S/rHhb5EkXwGKxrKs9yw5jc/KZq1
         dHeCU11OBE2YnlAKMBMZaBzsTPO4eKWZjjdT+zP9tOu7aw9bHR7Qa/XO0UOg12UrzRrz
         6ogW+05RcDl2ErWQuRlB10V/WysuZREC1mqC00Me+4RdVbLKotppAmQzV7skMiFow8Fu
         EwaHftdO6KnzORV2/Rf/zdM/0pDhvOwA7WMgelcxVED2FJHrYVQ4tctZAods5F2F8SL9
         9FqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776682711; x=1777287511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pIn4y25U9iTbZ6u0/nqOP41USOI/jaT9h/eIclbE8HQ=;
        b=ECk4FQd1LQX8Q0oh/pS0j0i7UPgjHPT2dXW/C8Fy3b4+K6TVFR85uVml81MbdqbTqD
         PWeSckjymiolci5H5DfyiaI1M0E5qCzC4G5EUpvxNc28DbotD1tfhl1CWq72op/T5uAx
         ZuuJ0A6EWhkDO4mhL3zA7EqtX5UVeWXwfmkywXiukpGPOOFj18IwCH09vOlTelL3BKDM
         yrEDkm9wiO4fVP7BvCNri2nABQG4PEhfoj60ilcuiULkhQ4re5GCd5VCl5B/9+hWKOvr
         QZ/MMMfgN+pSHp9WqT2PleyqFOJiKqalHkKbXRYC+c/IVVZIobEb9EJxARK6d/qzHhBS
         Q26A==
X-Forwarded-Encrypted: i=1; AFNElJ8OuFQQF03sWAmFGLuLj/qAOTIFT2h3eUHnK4dPLQiffHTqzIsrh6PcBPk7FheSwxIFZIy5ZeDvTLAPdznB@lists.linux.dev
X-Gm-Message-State: AOJu0Ywtx5vU5qOr99fP5XOS8O3BY1Bk0sGW/8+HPYLD8UI4RITO62PQ
	/KuWIbt2d112Nk9xseGYqn+QyyQCVL8kiz/sWWieKY06rCRRftFFC9Tu
X-Gm-Gg: AeBDievAUHEC+ff2DJqtE+LE80t7yu43l7W3H1MwrvvOl5mbnocXT3XWiublJBNwMjC
	3n/Aas2TK8nNj+AvZVavaO2MO1GN5ZSkSSpHZIHR4vsiSghUsH2IOhLAztgntPtB2e8Xty7RlEF
	OvJdFMxW66e5tZINnTZ7/ocHBLAoXDTN2oB64CXNp74Cz6ltoeCc18EIQl/E26azrtK9YHixt7L
	+km/iMSHLZle00sD4sPZ+eFtub/cf42PahI7Nwb6mdYlrZkMFI0d8DAbTEuWilt7WOd8KsuFz29
	842L6WbcMMRCpK8BzlfNThFf2tVXb09oFwfaEGBs3UhM/fnINgfX9jDA3Qa6nAZyV50fqfd/p/x
	T6QTg1zg1UwZWFLUAGDIwD9V9AEdjw2PQyyfS/ny9R+NljWCSwSbRho+z/qelybWl8JjFIipNiJ
	+UIV8w5uzrzxzNOFHmNd3sQQceLoOZvRiLcEwxzA==
X-Received: by 2002:a05:600c:530e:b0:485:4eaf:eb53 with SMTP id 5b1f17b1804b1-488fb768db3mr193873925e9.19.1776682711203;
        Mon, 20 Apr 2026 03:58:31 -0700 (PDT)
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
Subject: [PATCH bpf-next v4 2/6] net: move netfilter nf_reject6_fill_skb_dst to core ipv6
Date: Mon, 20 Apr 2026 10:58:12 +0000
Message-Id: <20260420105816.72168-3-mahe.tardy@gmail.com>
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

Move and rename nf_reject6_fill_skb_dst from
ipv6/netfilter/nf_reject_ipv6 to ip6_route_reply_fetch_dst in
ipv6/route.c so that it can be reused in the following patches by BPF
kfuncs.

Netfilter uses nf_ip6_route that is almost a transparent wrapper around
ip6_route_output so this patch inlines it.

Signed-off-by: Mahe Tardy <mahe.tardy@gmail.com>
---
 include/net/ip6_route.h             |  2 ++
 net/ipv6/netfilter/nf_reject_ipv6.c | 17 +----------------
 net/ipv6/route.c                    | 18 ++++++++++++++++++
 3 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/include/net/ip6_route.h b/include/net/ip6_route.h
index 09ffe0f13ce7..3652efec7081 100644
--- a/include/net/ip6_route.h
+++ b/include/net/ip6_route.h
@@ -100,6 +100,8 @@ static inline struct dst_entry *ip6_route_output(struct net *net,
 	return ip6_route_output_flags(net, sk, fl6, 0);
 }

+int ip6_route_reply_fetch_dst(struct sk_buff *skb);
+
 /* Only conditionally release dst if flags indicates
  * !RT6_LOOKUP_F_DST_NOREF or dst is in uncached_list.
  */
diff --git a/net/ipv6/netfilter/nf_reject_ipv6.c b/net/ipv6/netfilter/nf_reject_ipv6.c
index ef5b7e85cffa..9663d1db6d80 100644
--- a/net/ipv6/netfilter/nf_reject_ipv6.c
+++ b/net/ipv6/netfilter/nf_reject_ipv6.c
@@ -293,21 +293,6 @@ nf_reject_ip6_tcphdr_put(struct sk_buff *nskb,
 						   sizeof(struct tcphdr), 0));
 }

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
@@ -440,7 +425,7 @@ void nf_send_unreach6(struct net *net, struct sk_buff *skb_in,
 	if (hooknum == NF_INET_LOCAL_OUT && skb_in->dev == NULL)
 		skb_in->dev = net->loopback_dev;

-	if (!skb_dst(skb_in) && nf_reject6_fill_skb_dst(skb_in) < 0)
+	if (!skb_dst(skb_in) && ip6_route_reply_fetch_dst(skb_in) < 0)
 		return;

 	icmpv6_send(skb_in, ICMPV6_DEST_UNREACH, code, 0);
diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 19eb6b702227..41871fddec4d 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -2721,6 +2721,24 @@ struct dst_entry *ip6_route_output_flags(struct net *net,
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

