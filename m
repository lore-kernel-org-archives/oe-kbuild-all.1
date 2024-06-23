Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA1C1EA6E;
	Sun, 23 Jun 2024 17:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719162423; cv=none; b=Te0PlJXZ2ysKXAidyPrQtUfVwNVi8SUYEVs+3oJmjgcY4c9FR5vow66ivc4zMSNkfZSJKPSJCvOaPZxhV4tIYX2yIO95OkspuNcIbQj0LlxqsiUrggqBw3ZEzpwD+6FVSSogGcVruSSZVY9ER9FxQlttM0GWGn5+l+iil00aJqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719162423; c=relaxed/simple;
	bh=WZjoUCOQTTcm9hIfSsxXVUbrW5u08NOE8egCaIIh8uU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e/bAAQywkfsrDOEhljk+OfHMicv1Ef2maVt0ErJlq8CziniHXqsF9MdQ3TsfWmDK36Kf8pFthgXI/2lreCgpv+thecwSVct58lWk31NLlh8ysHSPdFErLf3xJhc5Hmut8Z9fXIhhPNf4Nroqu45CY8QJSja9AzeQ9nk7I/Q001o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oHoMwzUz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oHoMwzUz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAE87C2BD10;
	Sun, 23 Jun 2024 17:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719162423;
	bh=WZjoUCOQTTcm9hIfSsxXVUbrW5u08NOE8egCaIIh8uU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oHoMwzUz5a7mTmHNIPmfbGfgxkmXWrZgqOZ2pKVkBWrX+l3ptO51bi7fPjNftQWcA
	 d96ZWNhItZaoSb3ZypDbyOIUlgIayb+dtqV6PjzweErQFEScOlFlj0Cgekqp91ESad
	 wtedDBns+/Sd65NKGhJ8RvPiTdYb8RV8O15rXA4V64bPlIFvbxQJgTFkRsUxcxqblH
	 kOiwHLEeQYUbNXEZ/P5pJjQDQRIe/KjzRKSFa8/rHHgmP0Sn7VGC0dqZ6ZyAiWrcXU
	 w5GQrBqYBOmPXO7BTeYduO1YxYOv9otdQ3KT+MGOiEAnc+/NNxRV08j7StI08kw3JI
	 Fxl3X7gxgYV6w==
From: SeongJae Park <sj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	oe-kbuild-all@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: Re: [sj:damon/next 40/41] htmldocs: Warning: .clang-format references a file that doesn't exist: Documentation/process/clang-format.rst
Date: Sun, 23 Jun 2024 10:07:00 -0700
Message-Id: <20240623170700.74103-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <202406230906.sb8Wo0Vp-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Robot,

On Sun, 23 Jun 2024 09:18:42 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
> head:   43e3d7f62f7784b3fa9a05d39fb576e7bb726907
> commit: 8988ac5c02860893281688b11c2d0edd3ca8181a [40/41] Docs: Move clang-format from process/ to dev-tools/
> reproduce: (https://download.01.org/0day-ci/archive/20240623/202406230906.sb8Wo0Vp-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406230906.sb8Wo0Vp-lkp@intel.com/

Thank you for this report.  Fixed with the tags:
https://git.kernel.org/pub/scm/linux/kernel/git/sj/damon-hack.git/commit/?id=4f5c3c9e1d1881fc5bbb963e47cbb5ed38eeb1d1


Thanks,
SJ

[...]
