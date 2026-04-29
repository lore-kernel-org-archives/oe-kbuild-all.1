Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF0C1632E7;
	Wed, 29 Apr 2026 19:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777491797; cv=none; b=T+wd7qd8oR+Z8DI/c43MV3FjXbDJhMBJ+VHhvSmFOdsmLzfSai/Ik3wdiOMYUuP/vr4QascVUwLOjRjvsrbcZipfMEbZyenXKUSZKwfJ0GWQqDwvbBLaWTzMLDVrkVpt7+xCVznwU+7IgWRcEf4i4UGd3xsbHAmnzfei537Q+Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777491797; c=relaxed/simple;
	bh=XgL88bB6mMjj/1ua+1Enod6/huvDjdTngP3Y8rk8cPc=;
	h=Message-ID:From:To:Cc:Date:Subject; b=ZOfEx2qiYRJlSUw57yCddnpkNAo2BHsg6c7RYwtapZVYfEh149Ldi+7sFryJAwwY7gR1bHsWYE3UpcRy1UnXTJ9kqT9u6ptkzv2Q2+btog6AybtkLSifZL1QRoNZWYYZyEAykEQCxyhRSAtL/Zi44DetEO5PvZGKBbS9FehJnZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X1tOq8/m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X1tOq8/m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD228C19425;
	Wed, 29 Apr 2026 19:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777491796;
	bh=XgL88bB6mMjj/1ua+1Enod6/huvDjdTngP3Y8rk8cPc=;
	h=From:To:Cc:Date:Subject:From;
	b=X1tOq8/mXI+ARrNE9JFPmLFWf9qXqdNr2zWRipKRAKY3ITeQLbTS8utXCNSY/R1TO
	 e/W+T/9kFVJufO8DJg79/koSfb+LDVqSoE+4c4mbkDD/TMu/d9wAQli4IJBFGp1mEM
	 dWi/7zUJK9h4N9AS8Nh6JnxDJq9cO1TmMt/uZB08hUhEADHKtF0o5F0avOI+BCEF2Q
	 Kqw7ATNbvm2ziHd/bh8MaVjK38bjjJ8ZLvokhiq5LV2UAsvTsqYB5riZ2jcEqHl/hG
	 thj0JlO74jlcQAziRMhLG7Jq4xQ4mEaRSjM+PcikLEnq6+VNAMd5W2PvYydgIA0s3A
	 Ji42gs+js5jkA==
Message-ID: <1c2dcad8cf8bd630d705b2d4fa14568b@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Lai Jiangshan <jiangshanlai@gmail.com>,
 Breno Leitao <leitao@debian.org>,
 kernel test robot <lkp@intel.com>,
 oe-kbuild-all@lists.linux.dev
Date: Wed, 29 Apr 2026 09:42:37 -1000
Subject: [PATCH wq/for-7.1-fixes] workqueue: Annotate alloc_workqueue_va() with __printf(1, 0)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

alloc_workqueue_va() forwards its va_list to __alloc_workqueue() which
ultimately feeds vsnprintf(). __alloc_workqueue() already carries
__printf(1, 0); the new wrapper needs the same annotation so format
string checking propagates through the forwarding.

Fixes: 0de4cb473aed ("workqueue: fix devm_alloc_workqueue() va_list misuse")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202604300347.2LgXyteh-lkp@intel.com/
Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/workqueue.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 24d0265191d4..3d2e3b2ec528 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -5906,6 +5906,7 @@ static struct workqueue_struct *__alloc_workqueue(const char *fmt,
 	return NULL;
 }

+__printf(1, 0)
 static struct workqueue_struct *alloc_workqueue_va(const char *fmt,
 						   unsigned int flags,
 						   int max_active,
