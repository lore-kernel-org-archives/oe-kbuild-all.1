Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC7538B7A6;
	Wed, 29 Apr 2026 19:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777492720; cv=none; b=sb7eg7pw3Zlb3dhyFWVShu+N+XGkEFOxg27pRG4xifThVdUjFy7GhmTD/GLjekHk1PyCvaCr62NklK3QvLFZsJDey3EB8W1NtyT0MBXhuvenuapFlXyAdWa0G9DT8iPwGNz/5hUBi2YPraGGMMBx4lVfIohPFzlJsuBr7qv2DGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777492720; c=relaxed/simple;
	bh=4On9q+YNMjZwrVgOliG/yPlo5v2qcVcK0tim1QNL+BE=;
	h=Date:Message-ID:From:To:Cc:In-Reply-To:References:Subject; b=nh/enMazvxhNUXbsA70Nn7lPcdIS+5ch7l3nZvzjPnxvMqTvwjVzoirUD88sKsURcfDQHBHo8LNmUy068ovmlvsS7Xsq1EOSxzJDOx1rn7NNyaTikE+715zRHJ7+76YitUn5BHhT2aXF0hw1mk3WI+d6v1iBTIxIYi6kTzS0M2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DewlfcjC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DewlfcjC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3994C2BCB3;
	Wed, 29 Apr 2026 19:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777492719;
	bh=4On9q+YNMjZwrVgOliG/yPlo5v2qcVcK0tim1QNL+BE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=DewlfcjCzW6zs62scnkpxbDLbj2186KIzasX/qHl2wWhHUIOVXIC+BTqD2oBUT1Ae
	 3teKCac8NHqa/LMQ4Cn/NXxLrEdTR8ilw0pWvt3R4vUIO+R+759K4n0YZpecqb7IX8
	 nTcVZcJtxJz4Y6CZ8PF8zYGaBs/6NAykcF1E9a0WRe9oRmoIg5h3UR16s8j1rhYFJ1
	 WcFIvBd732WmR2jgPF+rDsjb10kOhm5ItMNvWYhGAz9LolZXyMpmWckoqSjcxl5UkH
	 l4ErtDBlGYQeEAgEjEHTR/bbX63wc9Qw9k8pyFYXyNLWqy2XarQbCtP/uJElGV0xcr
	 UPq4JsenOF1cQ==
Date: Wed, 29 Apr 2026 09:58:38 -1000
Message-ID: <5d61d43e6532c55ad3cdff6aed3318d8@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Lai Jiangshan <jiangshanlai@gmail.com>,
 Breno Leitao <leitao@debian.org>,
 kernel test robot <lkp@intel.com>,
 oe-kbuild-all@lists.linux.dev
In-Reply-To: <1c2dcad8cf8bd630d705b2d4fa14568b@kernel.org>
References: <1c2dcad8cf8bd630d705b2d4fa14568b@kernel.org>
Subject: Re: [PATCH wq/for-7.1-fixes] workqueue: Annotate alloc_workqueue_va() with __printf(1, 0)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hello,

Applied to wq/for-7.1-fixes.

Thanks.

--
tejun
