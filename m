Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9AB39D6F2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Apr 2026 10:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776682717; cv=none; b=RRdtphChTUXAMlQkm18m1jff+IJ0YRPqcbw209RoRIFaWIfq0mGBVvEgbeE+PPCDvIHN/kulauAAvqbJmxG3+/aKwr6aJeSeK1L1l304Iw2Bx0efjwLm4cvInh5TjEypiRGe6h9USDPxcOTwNUzlYdIbDxy43L/fwnmsFQII820=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776682717; c=relaxed/simple;
	bh=oDrClojuOmoFQWD8kdi7OYjx+xfYmqROcI/D6DoFoI0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mT/hchKQbqafkLYmLEJ4kIm7Glcr+XEiT+kIhretwdqE717JjOAEkAlAKIBnRwtcFw6ERnqXqWL59QakKSyoVtndTqggv5eJzlljc1Gqw/3MVos+ZY6vaLB9eHQCoDe5JcWrF1iTI3xhbIZQgcRgT7ODfblE8ZBNaTNvESg+bGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ABi8+3mc; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ABi8+3mc"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so44705445e9.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Apr 2026 03:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776682714; x=1777287514; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJxI2HSQPAxVmr77kvDE3un+rWp4GINOCWCL47TtY40=;
        b=ABi8+3mcJCRLClu+KBipqZV3O/fxd5lQxtXYtR/r6GJ3rxuLEIkGauMErL+FI7sDRL
         aLvwuI1OXN7X/T/pzcmXdB1i7QaHTl8YxpD/ByaAC0I+FJ9WYJVId1cUMbBHH/nm6JsX
         6uf75eeIRSs3Is6rPBxpHn12Y1c85I4WUabB83kA0W32Tu3fEw36CIMj533r4nleew+U
         04hvi4JM7AEWYPvsiVMyc9ipc1kN+EfmHsAw0wVlLQrUI06jqtPVE75YYkqKx0WErAm1
         347dZoHVBeLiu6V5zf5os0EKMLve8V6WVUxEK9IJGPwFuTYGjfKDg639B5TlLZSISs6L
         SkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776682714; x=1777287514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xJxI2HSQPAxVmr77kvDE3un+rWp4GINOCWCL47TtY40=;
        b=oHH7J2YJhR6xBtti9hagNg4k63yPjbwppt7RbuPCagbCuRIM0DY8En3EMyiZb+X6rG
         lo9IY6iNUSPrXWi3e5yHRIzilYjIa1QuKiSlr2eYLyGIKUinEUCChbX68iURTtZ9q16Z
         0skXEoP4Dhmdx97WgK7HplheljR6nNWvagFguzA6N8oyX3FTMKcErPBY3jpmw9ucL4Yv
         M3K9KuuooBNf7figBzf0/7OJgpYDz9XLg5+aocCg3GzQS1TakF15z0sr9qSrtnnbKYgU
         XgHypqDn5INcihjb+9ilZ+gstiR3pBfk33DhQrG0+xAJMdm18xOIOvwNhiE/Onj8T+DE
         YZww==
X-Forwarded-Encrypted: i=1; AFNElJ8ZPNXnDQ/t+RNv0NuQy+/vs87DPOwkh6yXIvax3q3PdG5WBvHSJkR/XrXFFdxgpOaZo/PbJpUDZ0BaMAqG@lists.linux.dev
X-Gm-Message-State: AOJu0YyRecPc8t6eO9bsaG4yyC576cfJNRknFbsxcIeLRolwrVHhETZV
	WM04Hb+bVVGKHq9AHqEzIj/k6EUdd66WRnATP/YpY74r2Ug5zc4w5PiE
X-Gm-Gg: AeBDieswrzqRxpvuJJ0psVK/BSNp3iPyLDsCOZ8x08h3Kgzjv+UXQbwYqwRtdwsUbRN
	JZ2PIW4biiL/Mo9w1mFTirqaHQsF+chScd3Rj4om2yFADZkGbRrSFcJZ+Z3Mo+pYA8RD4NIcJ+3
	/0/XRLkoH1By6cf8EcdpFiNvZeaAZyJwKfLPKNtoOTxeaGeUbDYeijtKi3at3KVpMayWXbz476u
	8KGt+X040c8YpROqEKXb/4fCAkGFXZqm44IYcwJUgzYd/pVs5GpAMNPuyydEmGWbY4c+uuGJN2Z
	eqf+krv0v0rp0jSbL7Yv8P8YMNOHi+vanR1AETW1PqE1o78cLbfAwUJKf6NDKKVYztGf1A6csxe
	Dw3tUo7mC/eNeGOq7wgSLNzppvVyfrvlIjY/pZd9YE5YS9xIZETb/UaTwY7wYGOS1JLIJzKII0o
	WOIyvBg6bQbN6KLJzvp3QmWSd6LNS87RnoIyg5eQ==
X-Received: by 2002:a05:600c:1da1:b0:488:f453:b976 with SMTP id 5b1f17b1804b1-488fb7844c5mr207471835e9.27.1776682713605;
        Mon, 20 Apr 2026 03:58:33 -0700 (PDT)
Received: from mtardy-friendly-lvh-runner.local ([2600:1900:4010:1a8::])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-488fc1cfbf2sm290929495e9.15.2026.04.20.03.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 03:58:33 -0700 (PDT)
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
Subject: [PATCH bpf-next v4 6/6] selftests/bpf: add icmp_send_unreach_recursion test
Date: Mon, 20 Apr 2026 10:58:16 +0000
Message-Id: <20260420105816.72168-7-mahe.tardy@gmail.com>
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

This test is similar to icmp_send_unreach_kfunc but checks that, in case
of recursion, meaning that the BPF program calling the kfunc was
re-triggered by the icmp_send done by the kfunc, the kfunc will stop
early and return -EBUSY.

Signed-off-by: Mahe Tardy <mahe.tardy@gmail.com>
---
 .../bpf/prog_tests/icmp_send_unreach_kfunc.c  | 43 +++++++++++++++++++
 .../selftests/bpf/progs/icmp_send_unreach.c   | 30 +++++++++++++
 2 files changed, 73 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/icmp_send_unreach_kfunc.c b/tools/testing/selftests/bpf/prog_tests/icmp_send_unreach_kfunc.c
index 047bfd4d80f7..a4f4324b2b99 100644
--- a/tools/testing/selftests/bpf/prog_tests/icmp_send_unreach_kfunc.c
+++ b/tools/testing/selftests/bpf/prog_tests/icmp_send_unreach_kfunc.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <test_progs.h>
 #include <network_helpers.h>
+#include <cgroup_helpers.h>
 #include <linux/errqueue.h>
 #include "icmp_send_unreach.skel.h"

@@ -10,6 +11,7 @@
 #define ICMP_DEST_UNREACH 3
 #define ICMPV6_DEST_UNREACH 1

+#define ICMP_HOST_UNREACH 1
 #define ICMP_FRAG_NEEDED 4
 #define NR_ICMP_UNREACH 15
 #define NR_ICMPV6_UNREACH 6
@@ -157,3 +159,44 @@ void test_icmp_send_unreach_kfunc(void)
 	icmp_send_unreach__destroy(skel);
 	close(cgroup_fd);
 }
+
+void test_icmp_send_unreach_recursion(void)
+{
+	struct icmp_send_unreach *skel;
+	int cgroup_fd = -1;
+	int *code;
+
+	skel = icmp_send_unreach__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "skel_open"))
+		goto cleanup;
+
+	if (setup_cgroup_environment()) {
+		fprintf(stderr, "Failed to setup cgroup environment\n");
+		goto cleanup;
+	}
+
+	cgroup_fd = get_root_cgroup();
+	if (!ASSERT_GE(cgroup_fd, 0, "get_root_cgroup"))
+		goto cleanup;
+
+	skel->links.recursion =
+		bpf_program__attach_cgroup(skel->progs.recursion, cgroup_fd);
+	if (!ASSERT_OK_PTR(skel->links.recursion, "prog_attach_cgroup"))
+		goto cleanup;
+
+	code = &skel->bss->unreach_code;
+	*code = ICMP_HOST_UNREACH;
+
+	trigger_prog_read_icmp_errqueue(code, AF_INET, "127.0.0.1");
+
+	/* Because there's recursion involved, the first call will return at
+	 * index 1 since it will return the second, and the second call will
+	 * return at index 0 since it will return the first.
+	 */
+	ASSERT_EQ(skel->data->rec_kfunc_rets[1], 0, "kfunc_rets[1]");
+	ASSERT_EQ(skel->data->rec_kfunc_rets[0], -EBUSY, "kfunc_rets[0]");
+
+cleanup:
+	icmp_send_unreach__destroy(skel);
+	close(cgroup_fd);
+}
diff --git a/tools/testing/selftests/bpf/progs/icmp_send_unreach.c b/tools/testing/selftests/bpf/progs/icmp_send_unreach.c
index 112b9cbfab6f..9aca7c0b12e1 100644
--- a/tools/testing/selftests/bpf/progs/icmp_send_unreach.c
+++ b/tools/testing/selftests/bpf/progs/icmp_send_unreach.c
@@ -15,6 +15,9 @@
 int unreach_code = 0;
 int kfunc_ret = -1;

+uint rec_count = 0;
+int rec_kfunc_rets[] = { -1, -1 };
+
 SEC("cgroup_skb/egress")
 int egress(struct __sk_buff *skb)
 {
@@ -67,4 +70,31 @@ int egress(struct __sk_buff *skb)
 	return SK_DROP;
 }

+SEC("cgroup_skb/egress")
+int recursion(struct __sk_buff *skb)
+{
+	void *data = (void *)(long)skb->data;
+	void *data_end = (void *)(long)skb->data_end;
+	struct iphdr *iph;
+
+	iph = data;
+	if ((void *)(iph + 1) > data_end || iph->version != 4)
+		return SK_PASS;
+
+	/* This call will provoke a recursion: the ICMP package generated by the
+	 * kfunc will re-trigger this program since we are in the root cgroup in
+	 * which the kernel ICMP socket belongs. However when re-entering the
+	 * kfunc, it should return EBUSY.
+	 */
+	rec_kfunc_rets[rec_count & 1] =
+		bpf_icmp_send_unreach(skb, unreach_code);
+	__sync_fetch_and_add(&rec_count, 1);
+
+	/* Let the first ICMP error message pass */
+	if (iph->protocol == IPPROTO_ICMP)
+		return SK_PASS;
+
+	return SK_DROP;
+}
+
 char LICENSE[] SEC("license") = "Dual BSD/GPL";
--
2.34.1

