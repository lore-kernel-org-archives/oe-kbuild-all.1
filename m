Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06942264A7C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Jul 2025 09:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753695849; cv=none; b=buszD8MtyCiCyKagdrsdJqz+oJ7HkigbgHXGDxoyRFWy/j6wrSbi72cRf9O7d5d3iOUEghWC32vKg8toVZPIFyzEsXX572yLzWBrye2EAEyP2dUbuV9cx2SIsy9XO+GCLNkKvKfUfe+k1dopnpeuTdhfnIUY9Iz0YFkE+foJqrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753695849; c=relaxed/simple;
	bh=4xXFPYbVAQVFYaiedRqz4YnnUv/G+c2nHre6wAx2+cA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kBScjMw75vSoge8cm6H7A3OFMOLW23s1ohhucaJj+3uGa6vgsKy4Fc6zAw5sXZHkaU2dU28diZaGJ2k1vBoMjEV8D0MkO4OnJpKPkBph9qdh6iezpacUuQ3FxIaZbT76cApKLlSLjQaGHA5D7JRWAUhi0JSztnYx/uNiO/xQ/nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cm+I4p7A; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cm+I4p7A"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4560cdf235cso20389995e9.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Jul 2025 02:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753695845; x=1754300645; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+P1pO0VcptRLVWqzHA93r4jnwUEPVrrjiHiUMAaRCc=;
        b=cm+I4p7AZ8IQUDg8IunPXNXYKh0kREVG2hOSetS937WcA8tsdremf3GvyVYqUZA3bJ
         rBw2BKD9Yw7ezeu7lu+byuMYWsOkT9z709yN+57nge7poHGFY89siLhUw358v9Oq/PeE
         qaSAYbKTHbxmvUoftClMeQ3b3ni1kng0M/xEI/D8qjOXqchqxhEM9aSOHD9c15c4I5Wx
         47HopTfcoLNrrYE29D5lf6Djn6wgLlbJ2bRddEM0SBWzD28Jy4teYa7tc30wRvGD9sJl
         rYda4xI9WiWf3ibFkgkMIpgVf0KWC5XJdd3Z+LgJok1SW+o+RyXD00sFDSjIgA/XFz/N
         XLkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695845; x=1754300645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+P1pO0VcptRLVWqzHA93r4jnwUEPVrrjiHiUMAaRCc=;
        b=kx2ZMVdmS9+WHe2Jq43BPcIXXt+z52zd4DSNeOBt3eNOo0IgDfYTVtpMgp7akb3Kvg
         76RE4yPsvcSh7+WWyHszqwszXE9hYeyZgk9RQU1I9bv2utBcNjC470sFO/47U5gWVSKc
         2/00SlfrMuNsffBQc59U9M4//69alEmU+j7GQ4UfGS3VUaE8tMM2ZfvTFOH12PAYOald
         JAtJCe5UGTkKv0g8eLW8vwvovHJUGmmog/uJeJNcfVlbz/R4Q2/rPcQu+7+OY38JMBhR
         mJ6mvUWS9wAMkvEF3/dMr+XgSgqAYnSu9woQU3+ibNNimzZzO730Jz6Qj52hkKqT7BCs
         a+Hg==
X-Forwarded-Encrypted: i=1; AJvYcCWpwk/QlMKuJZNv0Ehx7HZClvCM2MVxsTtdGF4fvkiXGiJoMKphFclylRWyuevpc2e0wWKCgzjdDYD74+uS@lists.linux.dev
X-Gm-Message-State: AOJu0Yxtu6ZuC8q5RJR80ui0wqjpAZai9dcDJdIUfF0+R8KD7EZKiSBY
	36yniR+b42PEDcOsvlzeGommI7vgi1iD3O20eT23xNzK6xGvXa3MUSaMQ91wrZIp
X-Gm-Gg: ASbGncs0XHFzREEMqu+wchkygtVggpdI5be8ZVbUd3u9E/5gDxFAhpE5HyL3hLnLDJH
	tQqAmHB9mw9pTerRVeVEgrgqjebzlLhScVsJ8kLEbRCWL9ZRksbIRi/oHYxRqfF2r8vIFMu1EVo
	D74nytqkpvyrBtE2gdD075HGRMp2PCmHSx+4rogJL1PQepntmZzXOt4GMK23Ma6HAWgYtSre5YL
	MDtPsHS/ZVhWSUMnu10ChnFkTCAf+HY/neOvuumL+0ZWzv70KIB8mn9RExXVACMECILgXzLIi+R
	idkvChD8YYN5zZoj0d1/ab1tzjPHuvR33284wtIgtp9DuN8FD6dV3P0pga816gU+c55rV42JtMD
	qzqvDhMhiom67hiMWRPpt/YkUewmEtC2iK6tHnj497lnCYCghHIY5NkAmOG4=
X-Google-Smtp-Source: AGHT+IHzSy4NMd3Qx5rCatTn1WF/YbRKeEsCFDcF0eoLwVoG3FrjFskFfEqD9sCCMOiZbDxG++AB9g==
X-Received: by 2002:a05:600c:1e89:b0:456:2379:c238 with SMTP id 5b1f17b1804b1-45876439296mr107541165e9.17.1753695844953;
        Mon, 28 Jul 2025 02:44:04 -0700 (PDT)
Received: from mtardy-friendly-lvh-runner.c.cilium-dev.internal ([2600:1900:4010:1a8::])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-458705bcbfbsm153422725e9.16.2025.07.28.02.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:44:04 -0700 (PDT)
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
Subject: [PATCH bpf-next v3 4/4] selftests/bpf: add icmp_send_unreach kfunc tests
Date: Mon, 28 Jul 2025 09:43:45 +0000
Message-Id: <20250728094345.46132-5-mahe.tardy@gmail.com>
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

This test opens a server and client, attach a cgroup_skb program on
egress and calls the icmp_send_unreach function from the client egress
so that an ICMP unreach control message is sent back to the client.
It then fetches the message from the error queue to confirm the correct
ICMP unreach code has been sent.

Note that the BPF program returns SK_PASS to let the connection being
established to finish the test cases quicker. Otherwise, you have to
wait for the TCP three-way handshake to timeout in the kernel and
retrieve the errno translated from the unreach code set by the ICMP
control message.

Signed-off-by: Mahe Tardy <mahe.tardy@gmail.com>
---
 .../bpf/prog_tests/icmp_send_unreach_kfunc.c  | 99 +++++++++++++++++++
 .../selftests/bpf/progs/icmp_send_unreach.c   | 36 +++++++
 2 files changed, 135 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/icmp_send_unreach_kfunc.c
 create mode 100644 tools/testing/selftests/bpf/progs/icmp_send_unreach.c

diff --git a/tools/testing/selftests/bpf/prog_tests/icmp_send_unreach_kfunc.c b/tools/testing/selftests/bpf/prog_tests/icmp_send_unreach_kfunc.c
new file mode 100644
index 000000000000..414c1ed8ced3
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/icmp_send_unreach_kfunc.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <test_progs.h>
+#include <network_helpers.h>
+#include <linux/errqueue.h>
+#include "icmp_send_unreach.skel.h"
+
+#define TIMEOUT_MS 1000
+#define SRV_PORT 54321
+
+#define ICMP_DEST_UNREACH 3
+
+#define ICMP_FRAG_NEEDED 4
+#define NR_ICMP_UNREACH 15
+
+static void read_icmp_errqueue(int sockfd, int expected_code)
+{
+	ssize_t n;
+	struct sock_extended_err *sock_err;
+	struct cmsghdr *cm;
+	char ctrl_buf[512];
+	struct msghdr msg = {
+		.msg_control = ctrl_buf,
+		.msg_controllen = sizeof(ctrl_buf),
+	};
+
+	n = recvmsg(sockfd, &msg, MSG_ERRQUEUE);
+	if (!ASSERT_GE(n, 0, "recvmsg_errqueue"))
+		return;
+
+	for (cm = CMSG_FIRSTHDR(&msg); cm; cm = CMSG_NXTHDR(&msg, cm)) {
+		if (!ASSERT_EQ(cm->cmsg_level, IPPROTO_IP, "cmsg_type") ||
+		    !ASSERT_EQ(cm->cmsg_type, IP_RECVERR, "cmsg_level"))
+			continue;
+
+		sock_err = (struct sock_extended_err *)CMSG_DATA(cm);
+
+		if (!ASSERT_EQ(sock_err->ee_origin, SO_EE_ORIGIN_ICMP,
+			       "sock_err_origin_icmp"))
+			return;
+		if (!ASSERT_EQ(sock_err->ee_type, ICMP_DEST_UNREACH,
+			       "sock_err_type_dest_unreach"))
+			return;
+		ASSERT_EQ(sock_err->ee_code, expected_code, "sock_err_code");
+	}
+}
+
+void test_icmp_send_unreach_kfunc(void)
+{
+	struct icmp_send_unreach *skel;
+	int cgroup_fd = -1, client_fd = 1, srv_fd = -1;
+	int *code;
+
+	skel = icmp_send_unreach__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "skel_open"))
+		goto cleanup;
+
+	cgroup_fd = test__join_cgroup("/icmp_send_unreach_cgroup");
+	if (!ASSERT_GE(cgroup_fd, 0, "join_cgroup"))
+		goto cleanup;
+
+	skel->links.egress =
+		bpf_program__attach_cgroup(skel->progs.egress, cgroup_fd);
+	if (!ASSERT_OK_PTR(skel->links.egress, "prog_attach_cgroup"))
+		goto cleanup;
+
+	code = &skel->bss->unreach_code;
+
+	for (*code = 0; *code <= NR_ICMP_UNREACH; (*code)++) {
+		// The TCP stack reacts differently when asking for
+		// fragmentation, let's ignore it for now
+		if (*code == ICMP_FRAG_NEEDED)
+			continue;
+
+		skel->bss->kfunc_ret = -1;
+
+		srv_fd = start_server(AF_INET, SOCK_STREAM, "127.0.0.1",
+				      SRV_PORT, TIMEOUT_MS);
+		if (!ASSERT_GE(srv_fd, 0, "start_server"))
+			goto for_cleanup;
+
+		client_fd = socket(AF_INET, SOCK_STREAM, 0);
+		ASSERT_GE(client_fd, 0, "client_socket");
+
+		client_fd = connect_to_fd(srv_fd, 0);
+		if (!ASSERT_GE(client_fd, 0, "client_connect"))
+			goto for_cleanup;
+
+		read_icmp_errqueue(client_fd, *code);
+
+		ASSERT_EQ(skel->bss->kfunc_ret, SK_DROP, "kfunc_ret");
+for_cleanup:
+		close(client_fd);
+		close(srv_fd);
+	}
+
+cleanup:
+	icmp_send_unreach__destroy(skel);
+	close(cgroup_fd);
+}
diff --git a/tools/testing/selftests/bpf/progs/icmp_send_unreach.c b/tools/testing/selftests/bpf/progs/icmp_send_unreach.c
new file mode 100644
index 000000000000..15783e5d1d65
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/icmp_send_unreach.c
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "vmlinux.h"
+#include <bpf/bpf_helpers.h>
+#include <bpf/bpf_endian.h>
+
+char LICENSE[] SEC("license") = "Dual BSD/GPL";
+
+int unreach_code = 0;
+int kfunc_ret = 0;
+
+#define SERVER_PORT 54321
+#define SERVER_IP 0x7F000001
+
+SEC("cgroup_skb/egress")
+int egress(struct __sk_buff *skb)
+{
+	void *data = (void *)(long)skb->data;
+	void *data_end = (void *)(long)skb->data_end;
+	struct iphdr *iph;
+	struct tcphdr *tcph;
+
+	iph = data;
+	if ((void *)(iph + 1) > data_end || iph->version != 4 ||
+	    iph->protocol != IPPROTO_TCP || iph->daddr != bpf_htonl(SERVER_IP))
+		return SK_PASS;
+
+	tcph = (void *)iph + iph->ihl * 4;
+	if ((void *)(tcph + 1) > data_end ||
+	    tcph->dest != bpf_htons(SERVER_PORT))
+		return SK_PASS;
+
+	kfunc_ret = bpf_icmp_send_unreach(skb, unreach_code);
+
+	/* returns SK_PASS to execute the test case quicker */
+	return SK_PASS;
+}
--
2.34.1

