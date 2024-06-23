Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D2018131A;
	Sun, 23 Jun 2024 17:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719162376; cv=none; b=Qcy5VHU3dUN4nLG1qCvOfHLV3lagilz+nP50oy16nYkOCIDTJH+SaJ+T1dNpa2VqhRqu7SbBUUM3zXnqDXK9wxxffRKaa5DEaTgHikVbM+eZFHspXbI5Vb+TqOz6Bc2RSzU+/iFACoWAnS8SWv/27kT36PEBy/BlA4j8iy2221U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719162376; c=relaxed/simple;
	bh=cRKMG+mXSIcS2QEOF2OdczbtsEc8nFjugTctUdbafZI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=plp+p4erMwEdHSaHcIvv+ao2Lst2N2DmLy3FgPYxaCLvBkVW3DpTEczDDKggknh6hZ3/P3a4AJZAGn7rJ9tnOuinV3OT6Hzh7I0a2hhC1PEFmBDMYymx+rLM6iAyGp+WLMEzq2hFyYsWNEiaAagfrhGVOqE9UMNnYfU6QBGvGOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O6Rnn9ba; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O6Rnn9ba"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5017C2BD10;
	Sun, 23 Jun 2024 17:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719162376;
	bh=cRKMG+mXSIcS2QEOF2OdczbtsEc8nFjugTctUdbafZI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O6Rnn9bavcXYeEWoWlaCqrjMZ7vYx2rC/YNuYKRaLK4PKi4wN6CXBW4r8rCdg8IKJ
	 QCOnZ/z0n3wFSsND1Q3+N2dSQUtUValvKCQXAK+GP/tzkyNogKUTpEi1fuuj6fMxvj
	 wxeEb50Q5BKiS0GIRucWwoKiI2ON31TmuWAeWbrZIg0tMzGX25A2j+qaRWb2VFEl33
	 lp2e7dgB/LJuVNNuO81O58XF21SvAdzQtdVSu2Dfsj3nyn/g86/kQMiBFiYbrdBX/K
	 T9ZlSdcMbw7GKD7e2mrOrxDk8YFFPzpEyUt0M80Ujv0uMtcqFjg5dJKYvuqIZpREI8
	 7oKNS7a6xZUfw==
From: SeongJae Park <sj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	oe-kbuild-all@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: Re: [sj:damon/next 39/41] htmldocs: Warning: Documentation/translations/it_IT/process/magic-number.rst references a file that doesn't exist: Documentation/process/magic-number.rst
Date: Sun, 23 Jun 2024 10:06:12 -0700
Message-Id: <20240623170612.74040-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <202406230842.ZjosN5fH-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Robot,

On Sun, 23 Jun 2024 08:45:55 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
> head:   43e3d7f62f7784b3fa9a05d39fb576e7bb726907
> commit: 3695c5fe023f1cd4dae33a4178c619b683b1874f [39/41] Docs: Move magic-number from process to staging
> reproduce: (https://download.01.org/0day-ci/archive/20240623/202406230842.ZjosN5fH-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406230842.ZjosN5fH-lkp@intel.com/

Thank you for this report.  Fixed:
https://git.kernel.org/pub/scm/linux/kernel/git/sj/damon-hack.git/commit/?id=16d6577678c8b3c81a613364d3c9c131b25140d8


Thanks,
SJ

[...]
