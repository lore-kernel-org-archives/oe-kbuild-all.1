Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECCCC8D7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jul 2024 15:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721577296; cv=none; b=PQ0P+WNVjmv7fkbIlBrIR99yKheiSo9zypoWrnZJnT98cXgBvF0SEzxygFF2hBS1XS8pJtREnwrQ2wthaZhvDszpUkosjGaep/IWkIJTnYXeg9AOPNi3PNhGY6+a8zUbHRntzawJDxdbDn8dydVrtXOekzDy3YaRruoR+yqTHnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721577296; c=relaxed/simple;
	bh=bV/CWQnnVNe1PQoz3tUhcr4Hl42MqugSmIdtVjyXANA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hsThXsc4vuostl5xMwLE/sgPTYzonJ7rYGARHrNJmEuzIbtLdS5D/h+xbgH0r6DbnG2sv6o/PI1E8TJz0DyyVh4F02ATJUVQ4rqV3MAnFjjm++yV59s5VgZMdboeW/asikXjcSoSyS8Yln8auAmCjv7oOF2zMnqtqsK2cP5vHm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KzxKM+8w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KzxKM+8w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 251D7C116B1;
	Sun, 21 Jul 2024 15:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721577296;
	bh=bV/CWQnnVNe1PQoz3tUhcr4Hl42MqugSmIdtVjyXANA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KzxKM+8weM4ADjuNAYDDdvoXzKXgY7Y4+WUhlHnYMbC/IeEUd0K59wjueULTAJXIB
	 e9KJ4T7HBU8uy6G7JMYlcClG+cF9ENAYYI9frnLeEXq2RIgQ39+EAas5yWgpscZKkz
	 tNd3HTCv6TR+eKfpDkFtazyjfUBzNroVqll55fcWOnnp9zFGtik2ltYiKb8UdB12ee
	 vJVgNAjx6W6bQgemVqeZq8OHbbY8q8l5Hqawg4RBGQbG9EYTPBlz6qlm+xIgMq4n9t
	 itEVlFvI2Rem3Lhl8NsnxCiGgBcNg86JNyYLD5oxEe8UBEscO822X0lIFG3rE8JsLx
	 jUoBOT3/ly95A==
From: SeongJae Park <sj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [sj:damon/next 47/56] mm/damon/vaddr.c:307:13: error: implicit declaration of function 'pmd_trans_huge'; did you mean 'pmd_trans_huge_lock'?
Date: Sun, 21 Jul 2024 08:54:53 -0700
Message-Id: <20240721155453.351860-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <202407211851.ymsqkPO7-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

On Sun, 21 Jul 2024 18:10:42 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
> head:   c3004f235d68aa890660b532b04714a40abafd78
> commit: 06463781fa1457eb6fb892eb36da7be303933de6 [47/56] mm/damon/Kconfig: select DAMON modules to test when test config is set
> config: sh-randconfig-002-20240721 (https://download.01.org/0day-ci/archive/20240721/202407211851.ymsqkPO7-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240721/202407211851.ymsqkPO7-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407211851.ymsqkPO7-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    mm/damon/vaddr.c: In function 'damon_mkold_pmd_entry':
> >> mm/damon/vaddr.c:307:13: error: implicit declaration of function 'pmd_trans_huge'; did you mean 'pmd_trans_huge_lock'? [-Wimplicit-function-declaration]
>      307 |         if (pmd_trans_huge(pmdp_get(pmd))) {
>          |             ^~~~~~~~~~~~~~
>          |             pmd_trans_huge_lock
[...]

Thank you for this report.  I confirmed the fix[1] I added to the tree
yesterday fixes this issue, too.  So, I think there's no more action to do for
this report from my side?  Please let me know if I'm missing something.

[1] https://lore.kernel.org/20240720182846.338785-1-sj@kernel.org


Thanks,
SJ
