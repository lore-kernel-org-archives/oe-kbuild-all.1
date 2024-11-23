Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F299E60B8A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Nov 2024 15:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732376753; cv=none; b=XhrG7n6aCHYPXRfF8w5LTLqjBaiF6YHEO61+5g8VDZUV9HE7aky5Fdp1xWzGSymx5SN4KqmvLneBm4sISF5wE0dP+rDYPxMfg5N+Gyn12V63aD6uB5gowAw+FfwbwKEzRjoNm26PAeu/hZKgKMixs4KGQa5VCEjc7nxC2muvR/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732376753; c=relaxed/simple;
	bh=I2nVTq56ZpNClD2IfvJ8BhMEIszJGasQIJomWP8QC0M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T4g1GVzPYTxtYH6SjZiRwIINx3islg8k1eFdeFPJJMf7QBEuqy3TxfgrSC0r5puFZYh5A3TX5CT/KGLgegUDFXNKqpZeua/VSnlOgjtLh04uRzuCUEfAp0JEs1a7KvtldrrX90RVX41+UebS2k8asptUMRkinrSejqBUYazUX3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bpoc9JVe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bpoc9JVe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D95C4CED2;
	Sat, 23 Nov 2024 15:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732376752;
	bh=I2nVTq56ZpNClD2IfvJ8BhMEIszJGasQIJomWP8QC0M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bpoc9JVerx1aAGf1OoSWtDxhPzpzsk33VbzU6LluJn+8XgUwGzL1d1cyxuJp1bZzr
	 Zm2vM8XNKXd/IKkdfSCKHgKPoJHXR03Kt2sCf/BZs+Oq+RupFEhwOnVGKPZD+VcpwW
	 Mrm6TIPoSjwt7Ql9tiTmK0OpUU0DPAt9EpG3o1XFtXwjJNNJ/+o5ktNXO7j0KxmRsQ
	 zeU0cTro5XqSAOYDnDa/MmisDTPHVFHQis9fgxwzDH/corobfunDsa1gduqWWywHaJ
	 AQAFuPLSAPRi4YrWvkmEfkmOG+5KYZGL8V6NR3gdDjDftXSsbaZSm90U4n1M74LY8Q
	 3/RwmPBb2yJpw==
From: SeongJae Park <sj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [sj:damon/next 53/59] mm/damon/core.c:1207: warning: bad line:
Date: Sat, 23 Nov 2024 07:45:49 -0800
Message-Id: <20241123154549.52753-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <202411231318.5NR1XkPk-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 23 Nov 2024 13:57:45 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
> head:   78907e9aaa2afc17557ccada5eeafa2f4423ddcc
> commit: d9418cac100e220d93d44553fd8c9bc713dc2eb4 [53/59] mm/damon/core: implement damon_call()
> config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20241123/202411231318.5NR1XkPk-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411231318.5NR1XkPk-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202411231318.5NR1XkPk-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> mm/damon/core.c:1207: warning: bad line: 
> 
> 
> vim +1207 mm/damon/core.c
> 
>   1196	
>   1197	/**
>   1198	 * damon_call() - Invoke a given function on a DAMON worker thread.
[...]
>   1206	 * be saved in &->return_code of @control.
> > 1207	
>   1208	 * If DAMON is deactivated by watermarks or terminated before the function is
[...]

Thank you for this report!  I just pushed the fix:
https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git/commit/?id=7401a702f38a981b1131c2b20ab142ccd833765e


Thanks,
SJ
