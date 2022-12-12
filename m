Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD267475
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Dec 2022 23:52:13 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id s9so10230533qtx.6
        for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Dec 2022 15:52:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qipOPsspidMxqoo4oBDYgeBgzcLXxHtxJQXaWmeGNjg=;
        b=AUWW3/CbIRNI12Q+91bbDYs+zhUc3LmEXSqa6nL/9t96MwDKbFgBKyQcdbO7Tp6pxq
         NLc2c31aNaMGw+eaYRzer+Fclmp1xjnHDN/P+Aw3Ssr1BkqcMnR2otWXREnabXV4Qv1h
         wTPAEZ9BG2sKS3AQqBS8RTQxEJBRSU1qQ2NtxifAMaSxqyujeJqVP6GMqRJ0hM4liBiQ
         1f/pZPq34sWMgz0z/3zgpWPbZ8eGwB49UXWOIWxck6EdJPCCNpStJPCCXuRCp9DaMrlg
         a3LDCQKMX12yjWCiEW0+5DayxR5Ka+X2JD40o7cOxzx/lG8L7//LeXkGLWgrsCeN2yDw
         IJjA==
X-Gm-Message-State: ANoB5pkw7UEnearteI9M5MmOh1YftmX9awbkJ0HpIAFeFMXutsbvRJAN
	NrK6Sh7qSCKrg9AdUR/bRgJPuAmlz0rY0A==
X-Google-Smtp-Source: AA0mqf4Wp4XQTmHb2uDmp+hxS/HsJMf+1tLsS6USDt/JjjnwBP/kexha3QbPXHM2Dm8Jgi9OPtjblQ==
X-Received: by 2002:ac8:6b4f:0:b0:3a8:270:c0b8 with SMTP id x15-20020ac86b4f000000b003a80270c0b8mr1577393qts.15.1670889132157;
        Mon, 12 Dec 2022 15:52:12 -0800 (PST)
Received: from maniforge.lan ([2620:10d:c091:480::1:6a51])
        by smtp.gmail.com with ESMTPSA id r18-20020a05620a299200b006fed2788751sm6895425qkp.76.2022.12.12.15.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 15:52:11 -0800 (PST)
Date: Mon, 12 Dec 2022 17:52:10 -0600
From: David Vernet <void@manifault.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexei Starovoitov <ast@kernel.org>, bpf@vger.kernel.org
Subject: Re: [linux-next:master 7935/14039] progs/task_kfunc_failure.c:76:36:
 error: no member named 'last_wakee' in 'struct task_struct'
Message-ID: <Y5e+qj8M3LZafhGK@maniforge.lan>
References: <202212130502.iuVFgkdf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202212130502.iuVFgkdf-lkp@intel.com>
User-Agent: Mutt/2.2.7 (2022-08-07)

On Tue, Dec 13, 2022 at 05:35:01AM +0800, kernel test robot wrote:
> Hi David,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   f925116b24c0c42dc6d5ab5111c55fd7f74e8dc7
> commit: fe147956fca4604b920e6be652abc9bea8ce8952 [7935/14039] bpf/selftests: Add selftests for new task kfuncs
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce:
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=fe147956fca4604b920e6be652abc9bea8ce8952
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout fe147956fca4604b920e6be652abc9bea8ce8952
>         make O=/tmp/kselftest headers
>         make O=/tmp/kselftest -C tools/testing/selftests
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>

Ah, task->last_wakee isn't defined on UP builds, my mistake. This patch
fixes the issue. I'll send the patch to the bpf list in a separate
email.

From 80ec7fa20b0beb1b047bfc66b49b0910c578da83 Mon Sep 17 00:00:00 2001
From: David Vernet <void@manifault.com>
Date: Mon, 12 Dec 2022 17:34:40 -0600
Subject: [PATCH bpf-next] bpf/selftests: Use parent instead of last_wakee in
 task kfunc test

Commit fe147956fca4 ("bpf/selftests: Add selftests for new task kfuncs")
added a negative selftest called task_kfunc_acquire_trusted_walked which
ensures that a BPF program that gets a struct task_struct * pointer from
walking a struct is properly rejected by the verifier if it tries to
pass that pointer to a task kfunc. In order to do this, it uses
task->last_wakee, but unfortunately that's not defined on UP builds.
Just use task->parent instead.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: fe147956fca4 ("bpf/selftests: Add selftests for new task kfuncs")
Signed-off-by: David Vernet <void@manifault.com>
---
 tools/testing/selftests/bpf/progs/task_kfunc_failure.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/progs/task_kfunc_failure.c b/tools/testing/selftests/bpf/progs/task_kfunc_failure.c
index 87fa1db9d9b5..60508c20041f 100644
--- a/tools/testing/selftests/bpf/progs/task_kfunc_failure.c
+++ b/tools/testing/selftests/bpf/progs/task_kfunc_failure.c
@@ -73,7 +73,7 @@ int BPF_PROG(task_kfunc_acquire_trusted_walked, struct task_struct *task, u64 cl
        struct task_struct *acquired;

        /* Can't invoke bpf_task_acquire() on a trusted pointer obtained from walking a struct. */
-       acquired = bpf_task_acquire(task->last_wakee);
+       acquired = bpf_task_acquire(task->parent);
        bpf_task_release(acquired);

        return 0;
--
2.38.1
