Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347EA29A5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Feb 2023 12:33:04 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id f16-20020a17090a9b1000b0023058bbd7b2so1788756pjp.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Feb 2023 04:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfPGdIBUWvYP18MdOLbq0gCotrm0pCwxe1TBwOkQhdo=;
        b=QXb/nWw4b87qF8YSl8JUHd3RCoF1GX7evfWX4ne/L6YJZMVKq+BwxKQcn81ZZUA1X5
         FWydNzPo6iaP3eurDnRSEfgYR/GP5PODttEMiN8SUyZmBWBhMjX0jwDehxn1rwPzstLS
         bhpSauaAXPLF2RBY9x8iM/7r/b/I9eccjYex1k2ywk6EKB4S6MlROzC2joI8nK3B5xsn
         rpkABqzRwQeFmnEfT/wqqbJp3hNgSsHt5D6Z8IpOOoLt1FloqJTwP7j6IAlYlfZbnpbL
         WCQVpEzj3I3cDFMSwsJK7/fWPixWHDLxyryXRBVQF3z03sdD3w44E/h3bQnenj8NXYMw
         StCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RfPGdIBUWvYP18MdOLbq0gCotrm0pCwxe1TBwOkQhdo=;
        b=Z2KvRhPfijsoreOF5MlaC/4H4DuncLTnmgDwdtdXUy2Ni40cmp3XMEFZcyL5Vf5noL
         RYUVvtpo9JU9Lplf4FxodsFkk+2Co2/PMYkUfa3i/NSJ4bJ5KRz+3f/vpy6SuHBfd4ts
         ZYnxcCbbHO9MYOhx3vxfmzjbdCWBW3LlkTK00EQ9lP63E1/PR9ZntKCfLNNOKuSANvkH
         O3RWydUmaW0d4lGPcqd2KTBPQA+I48+37JbW8bVCPI6nwRacRUJBMHf+nCs8BRPJMDqm
         +ORVDzeOXfguMf0vIjZrKaN1A6PGAh1iiwV/S+fmIaRdvAUiqjT9XVnyj1iTC2Fy/+Iv
         Pfqw==
X-Gm-Message-State: AO0yUKVVf/SHv32XBByW3QgwVLikFhBLxbBhXqRSBXAzpstXg5rWEErG
	r0it9VGEwiZNSX9K1KgCrf0=
X-Google-Smtp-Source: AK7set/dr+zE9J2Qf60cfvGWYt1fheRGnO5xCtk/WJ06lcoNPjdrbYIZrpoqwG8gM64yCg0+/o3O5w==
X-Received: by 2002:a17:903:2803:b0:196:1c45:6fc8 with SMTP id kp3-20020a170903280300b001961c456fc8mr1801744plb.60.1676464383516;
        Wed, 15 Feb 2023 04:33:03 -0800 (PST)
Received: from debian.me (subs03-180-214-233-93.three.co.id. [180.214.233.93])
        by smtp.gmail.com with ESMTPSA id jh20-20020a170903329400b0019ad6451a67sm108767plb.24.2023.02.15.04.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 04:33:03 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
	id BF947105177; Wed, 15 Feb 2023 19:32:58 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Power Management <linux-pm@vger.kernel.org>,
	Linux BPF Development <bpf@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Huang Rui <ray.huang@amd.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Dave Marchevsky <davemarchevsky@fb.com>,
	Perry Yuan <perry.yuan@amd.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Wyes Karny <wyes.karny@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	oe-kbuild-all@lists.linux.dev,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH 1/3] Documentation: hw-vuln: Wrap mitigate_smt_rsb example in literal code block
Date: Wed, 15 Feb 2023 19:32:51 +0700
Message-Id: <20230215123253.41552-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215123253.41552-1-bagasdotme@gmail.com>
References: <20230215123253.41552-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1453; i=bagasdotme@gmail.com; h=from:subject; bh=NlIucDSsMzvXPzZxHVDpD0xEEtWua/CgvF9JyzYMKNk=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDMlvLnwJWuIrJ6V+hMMv94SlmvfRDb/TKrprgx8H5B9K+vZ4 f/z8jlIWBjEuBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAEwknofhn4ZpT7iExeyPMeazQwzOnQ 8L3qHXJzNF3TxRr79g20RpaYb/pRNZdLcuyLPbFK+u9OycTqFZ/cfVmWckbvpP2li4aasQOwA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Stephen Rothwell reported htmldocs warning when making htmldocs from
Linus's Tree:

Documentation/admin-guide/hw-vuln/cross-thread-rsb.rst:92: ERROR: Unexpected indentation.

Fix the warning by formatting example of mitigate_smt_rsb module parameter
as literal code block.

Link: https://lore.kernel.org/linux-next/20230215144117.369ffb5f@canb.auug.org.au/
Fixes: 493a2c2d23ca91 ("Documentation/hw-vuln: Add documentation for Cross-Thread Return Predictions")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/admin-guide/hw-vuln/cross-thread-rsb.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/hw-vuln/cross-thread-rsb.rst b/Documentation/admin-guide/hw-vuln/cross-thread-rsb.rst
index ec6e9f5bcf9e89..3593d30ccfde12 100644
--- a/Documentation/admin-guide/hw-vuln/cross-thread-rsb.rst
+++ b/Documentation/admin-guide/hw-vuln/cross-thread-rsb.rst
@@ -88,5 +88,6 @@ capability to override those interceptions, but since this is not common, the
 mitigation that covers this path is not enabled by default.
 
 The mitigation for the KVM_CAP_X86_DISABLE_EXITS capability can be turned on
-using the boolean module parameter mitigate_smt_rsb, e.g.:
+using the boolean module parameter mitigate_smt_rsb, e.g.::
+
         kvm.mitigate_smt_rsb=1
-- 
An old man doll... just what I always wanted! - Clara

