Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C48321BA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 23:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JgWEeuJj"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5890aa0573aso3196797a12.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 16:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696981370; x=1697586170; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EToU3lcbSlwy9fy/0jMo1G59SHr9e1KfON9mi7yvsw0=;
        b=JgWEeuJj5U5E+lNwSrUHfycaxXKqHmSEqivhHnqgdOhKxiksZSPayGjbzYwi02w/dh
         0gCKDnQaVbemBQO6ieeJDJS7cqAfboQuchLV9VYmyBCP/79MB8m8rBtVjK8sHr7lKPB6
         yVt7gZquQrUOQoNpMUs8WHanjU5jycLbS5wq0l+nCuiCrtHITf/AN/SThpVBGw0i3U/8
         s41Yfa/nUWL2mJkpXra8P9y8OvWwS1RsIqkR90GipL7QSlBdP0tWEX/KUvmgNIjp4DbQ
         GwqFYVlGk0fcIQ4+osHnkVi+CYDlIj9zgTN237jQPrlEJQFtYSHpiIDFHO1Kt3cTLCdJ
         OFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696981370; x=1697586170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EToU3lcbSlwy9fy/0jMo1G59SHr9e1KfON9mi7yvsw0=;
        b=U9fsyb68dwL0OtxOtUo2QiLRZQ4xrfZulNF1Te5laAbcPU46bS6AYf2NExcsQxbjAp
         8VVBmxZcOsBVEJKxcwoIkpZ//eKjJJMmwXZ1gMn+rqOYqiwFqY7Lm7kaAqhWBccwQRgK
         mLNW4bc3eD1Sww6NvMPlGHqy5jHtWvuTlKGEszt4qrgU2XwhoAFmO0XDkcAmT8OXSjS2
         vImY6AEOJkTSfB5xasps7pCjM1QnCxAyd8FGrNxLVTQSGvSxMJGVVlRLs11SjdkjBGd4
         PJWqx4EldiWBq98/svnEy9eQtSm2WUb5zxg+f5Q++qJRI38fshV+LZg+1/XNrlv976UG
         YgUA==
X-Gm-Message-State: AOJu0YysDvnP0H7b4dcLYlZdOR6HBLTBI2skh3aSV3xekPg62FfsoHB+
	nmU+ljTjZt7aBNIPCScxeMc=
X-Google-Smtp-Source: AGHT+IGu+0+ZHZ9VhVStWuztl/a8lzxt0oDn4QWcUF/L/whuSBgOn+oTwj+AOI0uz1bk7Ajof/RD3A==
X-Received: by 2002:a05:6a20:da9d:b0:16c:b5be:5f6c with SMTP id iy29-20020a056a20da9d00b0016cb5be5f6cmr12546254pzb.54.1696981369486;
        Tue, 10 Oct 2023 16:42:49 -0700 (PDT)
Received: from bangji.hsd1.ca.comcast.net ([2601:647:6780:42e0:f301:6279:8c99:9912])
        by smtp.gmail.com with ESMTPSA id h13-20020a170902f54d00b001c61921d4d2sm12420404plf.302.2023.10.10.16.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 16:42:49 -0700 (PDT)
Sender: Namhyung Kim <namhyung@gmail.com>
From: Namhyung Kim <namhyung@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-perf-users@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [PATCH] perf tools: Do not ignore the default vmlinux.h
Date: Tue, 10 Oct 2023 16:42:47 -0700
Message-ID: <20231010234247.71604-1-namhyung@kernel.org>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
In-Reply-To: <202310110451.rvdUZJEY-lkp@intel.com>
References: <202310110451.rvdUZJEY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The recent change made it possible to generate vmlinux.h from BTF and
to ignore the file.  But we also have a minimal vmlinux.h that will be
used by default.  It should not be ignored by GIT.

Fixes: b7a2d774c9c5 ("perf build: Add ability to build with a generated vmlinux.h")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202310110451.rvdUZJEY-lkp@intel.com/
Signed-off-by: Namhyung Kim <namhyung@kernel.org>
---
 tools/perf/util/bpf_skel/vmlinux/.gitignore | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 tools/perf/util/bpf_skel/vmlinux/.gitignore

diff --git a/tools/perf/util/bpf_skel/vmlinux/.gitignore b/tools/perf/util/bpf_skel/vmlinux/.gitignore
new file mode 100644
index 000000000000..49502c04183a
--- /dev/null
+++ b/tools/perf/util/bpf_skel/vmlinux/.gitignore
@@ -0,0 +1 @@
+!vmlinux.h
-- 
2.42.0.609.gbb76f46606-goog

