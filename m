Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217264315A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jan 2025 02:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736735620; cv=none; b=guM62J9yTRnSFpbgqjR1cE0B/W48KnF/QGGZky2O8cTEpKpOthcIoIQFhgdqK+nP7V1VK6YeC0GRiH/WJRT0Vft2CN2GTBdKTHtatQLRSe1JB9uo++H9ANS7pgEtkNbWFkEdzr136bnsboFZTIXYCQPU6IU4BPytcWPPaAv9Yz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736735620; c=relaxed/simple;
	bh=KbF0qP1vSxTPlYtBDXYKvVDalbRHDTGiPiqpYchnszQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=HW9SJaP7I6ch6pFsrrY/nfHtbl1B+pcIaMabnaPwuqBAU7v3Qo5b+aYtb9IcaNZs8kMSdNOh6BXqu6R4gxeBBNwInF1S5LGyBoVvc5nuK7gMZ1S12jn4JCYwFGvQ3CTCcS/rRUQeGljY5jj5TiVfKd06ldBcypYoot1dSJ2By/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dnOWtYc4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dnOWtYc4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60AA5C4CEDF;
	Mon, 13 Jan 2025 02:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1736735619;
	bh=KbF0qP1vSxTPlYtBDXYKvVDalbRHDTGiPiqpYchnszQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dnOWtYc4TziA7MoLTdmdSwg6qD3dSEVeWyvWxz2Mwi3lekmVcCtr5WyyEVBj2R8K+
	 I0T3x22YDhK5/F0bwgokYtm53Spbui6sM6E7MWsLf0BRCnn2AXrCaGASE1OZHoS/ri
	 Q+/S/7BHMzssSIWJoSjq0QMAVI22lJmb4PWq8dkg=
Date: Sun, 12 Jan 2025 18:33:38 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Linux
 Memory Management List <linux-mm@kvack.org>, Frederic Weisbecker
 <frederic@kernel.org>
Subject: Re: [akpm-mm:mm-nonmm-unstable 171/173] kernel/kthread.c:913:
 warning: expecting prototype for kthread_create_worker_on_node(). Prototype
 was for kthread_create_worker() instead
Message-Id: <20250112183338.0ac4e721a48829afffd16073@linux-foundation.org>
In-Reply-To: <c883110c-6baf-410e-8a77-4c2501060375@infradead.org>
References: <202501122249.upmy4970-lkp@intel.com>
	<c883110c-6baf-410e-8a77-4c2501060375@infradead.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 12 Jan 2025 10:21:40 -0800 Randy Dunlap <rdunlap@infradead.org> wrote:

> > 
> > fbae2d44aa1df7 Petr Mladek  2016-10-11  901  
> > fbae2d44aa1df7 Petr Mladek  2016-10-11  902  /**
> > 1bc3c5db9becd0 Randy Dunlap 2025-01-10  903   * kthread_create_worker_on_node - create a kthread worker
> > dbf52682cb0286 Petr Mladek  2016-10-11  904   * @flags: flags modifying the default behavior of the worker
> > fbae2d44aa1df7 Petr Mladek  2016-10-11  905   * @namefmt: printf-style name for the kthread worker (task).
> > fbae2d44aa1df7 Petr Mladek  2016-10-11  906   *
> > fbae2d44aa1df7 Petr Mladek  2016-10-11  907   * Returns a pointer to the allocated worker on success, ERR_PTR(-ENOMEM)
> > fbae2d44aa1df7 Petr Mladek  2016-10-11  908   * when the needed structures could not get allocated, and ERR_PTR(-EINTR)
> > d25c83c6606ffc Petr Mladek  2022-03-15  909   * when the caller was killed by a fatal signal.
> > fbae2d44aa1df7 Petr Mladek  2016-10-11  910   */
> > fbae2d44aa1df7 Petr Mladek  2016-10-11  911  struct kthread_worker *
> > dbf52682cb0286 Petr Mladek  2016-10-11  912  kthread_create_worker(unsigned int flags, const char namefmt[], ...)
> > fbae2d44aa1df7 Petr Mladek  2016-10-11 @913  {
> 
> @Andrew: I don't know how to handle this. My patch applies correctly to linux-next
> where this function name has been changed. It looks like 0day is applying it
> to mainline linux + your tree(s?) for testing.

It appears to be a fix against Frederic's b1e125dcbcea ("kthread: Unify
kthread_create_on_cpu() and kthread_create_worker_on_cpu() automatic
format") so it would best be carried in whatever tree holds
b1e125dcbcea.

From: Randy Dunlap <rdunlap@infradead.org>
Subject: kthread: modify kernel-doc function name to match code
Date: Fri, 10 Jan 2025 22:30:08 -0800

kthread.c:1073: warning: expecting prototype for kthread_create_worker(). Prototype was for kthread_create_worker_on_node() instead

Link: https://lkml.kernel.org/r/20250111063008.910712-1-rdunlap@infradead.org
Fixes: b1e125dcbcea ("kthread: Unify kthread_create_on_cpu() and kthread_create_worker_on_cpu() automatic format")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Frederic Weisbecker <frederic@kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 kernel/kthread.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/kernel/kthread.c~kthread-modify-kernel-doc-function-name-to-match-code
+++ a/kernel/kthread.c
@@ -900,7 +900,7 @@ fail_task:
 }
 
 /**
- * kthread_create_worker - create a kthread worker
+ * kthread_create_worker_on_node - create a kthread worker
  * @flags: flags modifying the default behavior of the worker
  * @namefmt: printf-style name for the kthread worker (task).
  *
_

