Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFE039B964
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Apr 2026 10:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776682716; cv=none; b=ohwZUj4cf4RBHeTD4v0HUiE3VFEsbHTlwhYiE4XH6mAusuCY+AlyZ4mA5gURYLeXlRq9IluD3Tl3hD43Tgw0FWIXOcZOYWWNm2s2LNM6b03LIBH3CK0TzZqETvfhUTF87gRIkBuonFDr/Fuhu7NxXIlKhDTYjrqemm7UJ7PWVDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776682716; c=relaxed/simple;
	bh=tGFWlJ9Emn6lMayfM7X7YT7f2+X67E/6qliDHAALv6U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bD8BiBvUaEE7ZGJt87q3s0uLCz2V6q/T6gQ/eH8RF8HuTDMXSAKHBDlEYcasoR0h/OYFfj7wHszPOXM/bN+fbI8P8yIouPlJP5MfuqLRd6g7VjJ/hHbzuKCv04Tj8bk/qvterHjJMjbiD4BEhikidenTxhDBDTc3+LMdc9gH22A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IC5akWKL; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IC5akWKL"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4891f625344so6812185e9.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Apr 2026 03:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776682712; x=1777287512; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xo1ra+dvGbFs6OJejHFLsiY9EUjfbBrgYOeoScEsTuc=;
        b=IC5akWKLTJAaTb3YW7+maHWCEpmrJn7I/WsSbZXzae/FOv6GTuFU1pXRVpKEC0iwPY
         mxG9fcm1CrpyNkwsJijmTeCDQ3ZFD5OElczniaO1reu76we7n7/5bzYG7Qu4/hkS3wOy
         /AI623R1TAXABkh0BCqrCH7yxxMQXWeCLi5rhd2V6ItaJxbNNQLd69LEBU/W6xiqCiK5
         d5L6zBgoWXnyoTOJFUfr0bXa3Agzv8LqcI59M0n85kgoS0V3WnOuyD5TWP5QqRiZCSdM
         8hlzYuiDv+AoSvEt9iD349i4EuI+ldrtANqfMkwnv7KGsXH7SbQ2+plvBYuBoMt2WOBZ
         118g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776682712; x=1777287512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xo1ra+dvGbFs6OJejHFLsiY9EUjfbBrgYOeoScEsTuc=;
        b=T/uWogRD7iYuiiUPQrayL56ql6jSpj8YsFM8c9RsOv/8+oknmlfLlDPTj7WylwuozC
         gXZrgvrylMtx1twWXVcqvj+t/wkWO3ibxoeYq8z+/tqzH8yUS7jQY9E76AoJ556ZlODn
         XMx61WVNIFHNvyuyL5WQANYDqBDt+/XpeRhr5+BVw0Afs6jio1TbPsi3p2sF8ZJTk1oA
         r1JD+9nGkSDRbrx8SYb7oMC37zvFQxH1U92lqV04j+sIHWEPrcMfKRduz+X1N+5fdEbk
         uTTAgCuYOc2uVs9fFGk7cU6vOUO60E0jGGV/YHbwYPlcx90JGUEkT+HN3sy8kje9wA1n
         10iw==
X-Forwarded-Encrypted: i=1; AFNElJ9VIJoQM+mTnvxcHBWjWWsZMpXyRVySjBbHVb7PXIz0uVfXtP9G0IFxMe4KF8eTiNmHzX000bqTI+ugQN80@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/HnqgrB9ppDD/Ifhj5jTCDab55o4z7TXiz1MaaQV+PrkoKcCc
	Be5cHIlECaPpfIv9cRf2/gF21Af3gUVy7hGhABNNlXtErywaC4zX//zM
X-Gm-Gg: AeBDietlzjlwePyf8kNuIKugQ57c6apCuFHeN/YUdbD2/VZQk4pK9MEcxf6xrIAj1nt
	b/87ivXB+rFpZL5eN6XkspPAZ5HQnRsgmTAebHRu/K7LtHPajeL5VrJxAv+Hz/X/WXFiQhox0+0
	0hDWaTxCEpuTfrdP4wCeci8Sxi1Z5CkQkD86vz/58Kbx0jso0eka9zwBwipMN2XDD+1ExdOFw7B
	as1feg3cwtpodKaCuBffU+hnZ5pZbbm4iZ2zNj+mU4OR5KrnaiU31uoUMgj1gz1jkESxwSgcMiX
	w6MVgBnbkamaArfQiUPhSiomZNhCzRK1zj7qTcYzWab/QyS+4p1L8FRTIu4ro5OJnnR4MmzlgMH
	zxJwrM5SDe5Jv+GuK5C5Zi9J52N2FcyELDFCuk9Vv7gTJ9NcHDycv3PdhSW7NhSRvPtYu7liaiz
	+Pq2MhMDxzbEbI7egw3s7Kqzm6aufLqANfSdORfQ==
X-Received: by 2002:a05:600c:870e:b0:488:aa33:dc8f with SMTP id 5b1f17b1804b1-488fb84ffb8mr180290575e9.0.1776682711829;
        Mon, 20 Apr 2026 03:58:31 -0700 (PDT)
Received: from mtardy-friendly-lvh-runner.local ([2600:1900:4010:1a8::])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-488fc1cfbf2sm290929495e9.15.2026.04.20.03.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 03:58:31 -0700 (PDT)
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
Subject: [PATCH bpf-next v4 3/6] bpf: add bpf_icmp_send_unreach kfunc
Date: Mon, 20 Apr 2026 10:58:13 +0000
Message-Id: <20260420105816.72168-4-mahe.tardy@gmail.com>
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

This is needed in the context of Tetragon to provide improved feedback
(in contrast to just dropping packets) to east-west traffic when blocked
by policies using cgroup_skb programs.

This reuse concepts from netfilter reject target codepath with the
differences that:
* Packets are cloned since the BPF user can still let the packet pass
  (SK_PASS from the cgroup_skb progs for example) and the current skb
  need to stay untouched (cgroup_skb hooks only allow read-only skb
  payload). The kfunc set the dst of the cloned skb by using the saddr
  as the daddr and routing it.
* Checksums are not computed or verified and IPv4 fragmentation is not
  checked early (icmp_send will check).
* We protect against recursion since the kfunc, by generating an ICMP
  error message could retrigger the BPF prog that invoked it.

Signed-off-by: Mahe Tardy <mahe.tardy@gmail.com>
---
 net/core/filter.c | 85 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/net/core/filter.c b/net/core/filter.c
index fcfcb72663ca..a6c3b9145c93 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -84,6 +84,10 @@
 #include <linux/un.h>
 #include <net/xdp_sock_drv.h>
 #include <net/inet_dscp.h>
+#include <linux/icmp.h>
+#include <net/icmp.h>
+#include <net/route.h>
+#include <net/ip6_route.h>

 #include "dev.h"

@@ -12423,6 +12427,86 @@ __bpf_kfunc int bpf_xdp_pull_data(struct xdp_md *x, u32 len)
 	return 0;
 }

+static DEFINE_PER_CPU(bool, bpf_icmp_send_in_progress);
+
+/**
+ * bpf_icmp_send_unreach - Send ICMP destination unreachable error
+ * @skb: Packet that triggered the error
+ * @code: ICMP unreachable code (0-15 for IPv4, 0-6 for IPv6)
+ *
+ * Sends an ICMP destination unreachable message in response to the
+ * packet. The original packet is cloned before sending the ICMP error,
+ * so the BPF program can still let the packet pass if desired.
+ *
+ * Recursion protection: If called from a context that would trigger
+ * recursion (e.g., root cgroup processing its own ICMP packets),
+ * returns -EBUSY on re-entry.
+ *
+ * Return: 0 on success, negative error code on failure:
+ *         -EINVAL: Invalid code parameter
+ *         -ENOMEM: Memory allocation failed
+ *         -EHOSTUNREACH: Routing lookup failed
+ *         -EBUSY: Recursion detected
+ *         -EPROTONOSUPPORT: Non-IP protocol
+ */
+__bpf_kfunc int bpf_icmp_send_unreach(struct __sk_buff *__skb, int code)
+{
+	struct sk_buff *skb = (struct sk_buff *)__skb;
+	struct sk_buff *nskb;
+	bool *in_progress;
+
+	in_progress = this_cpu_ptr(&bpf_icmp_send_in_progress);
+	if (*in_progress)
+		return -EBUSY;
+
+	switch (skb->protocol) {
+#if IS_ENABLED(CONFIG_INET)
+	case htons(ETH_P_IP):
+		if (code < 0 || code > NR_ICMP_UNREACH)
+			return -EINVAL;
+
+		nskb = skb_clone(skb, GFP_ATOMIC);
+		if (!nskb)
+			return -ENOMEM;
+
+		if (!skb_dst(nskb) && ip_route_reply_fetch_dst(nskb) < 0) {
+			kfree_skb(nskb);
+			return -EHOSTUNREACH;
+		}
+
+		*in_progress = true;
+		icmp_send(nskb, ICMP_DEST_UNREACH, code, 0);
+		*in_progress = false;
+		kfree_skb(nskb);
+		break;
+#endif
+#if IS_ENABLED(CONFIG_IPV6)
+	case htons(ETH_P_IPV6):
+		if (code < 0 || code > ICMPV6_REJECT_ROUTE)
+			return -EINVAL;
+
+		nskb = skb_clone(skb, GFP_ATOMIC);
+		if (!nskb)
+			return -ENOMEM;
+
+		if (!skb_dst(nskb) && ip6_route_reply_fetch_dst(nskb) < 0) {
+			kfree_skb(nskb);
+			return -EHOSTUNREACH;
+		}
+
+		*in_progress = true;
+		icmpv6_send(nskb, ICMPV6_DEST_UNREACH, code, 0);
+		*in_progress = false;
+		kfree_skb(nskb);
+		break;
+#endif
+	default:
+		return -EPROTONOSUPPORT;
+	}
+
+	return 0;
+}
+
 __bpf_kfunc_end_defs();

 int bpf_dynptr_from_skb_rdonly(struct __sk_buff *skb, u64 flags,
@@ -12442,6 +12526,7 @@ int bpf_dynptr_from_skb_rdonly(struct __sk_buff *skb, u64 flags,

 BTF_KFUNCS_START(bpf_kfunc_check_set_skb)
 BTF_ID_FLAGS(func, bpf_dynptr_from_skb)
+BTF_ID_FLAGS(func, bpf_icmp_send_unreach)
 BTF_KFUNCS_END(bpf_kfunc_check_set_skb)

 BTF_KFUNCS_START(bpf_kfunc_check_set_skb_meta)
--
2.34.1

