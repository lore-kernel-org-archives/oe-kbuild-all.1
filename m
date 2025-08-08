Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6BE22FF39
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Aug 2025 17:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754673085; cv=none; b=X33i4dQP6uNr+rOYuqvND/mdbwD7kJK3Xq+xzggwe0cTo2SqxU+3yYRjl/woG5iqJoKLxlODavoHslBin+SBCl2iwUpzIOfUCktad6AaobqQdmCbi49sHWFtF3C5G5QMxviXwODdNKuXmqur2RHhQ6axxvcGSdegY6EoM+ho2U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754673085; c=relaxed/simple;
	bh=cxbahvdxrfG2bKXR2hXt2zf+TgKZQvSGJhqzadrT3gY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AexrDsyi08JqFG99RRV2xww7jvtqDMELfQAd42p5/0RGy7Riou98hF2En+5T8W1RWovv3ky31kXptVGunBkFzp7a333vkgc6LVOOqRivFaDkiwF2YaANJbB0RG3WZ8LO5GATO3LxqzATEfsqaA/ZVsOz6QwKeR7Va8ECinJXaAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CElcqtEb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CElcqtEb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 442DDC4CEED;
	Fri,  8 Aug 2025 17:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754673084;
	bh=cxbahvdxrfG2bKXR2hXt2zf+TgKZQvSGJhqzadrT3gY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CElcqtEbjbOBhnao5gJCZSLSGFC2i1yRR9YmciKVw/TuVzK2lZoP9TvQvBZ6MEgQN
	 sDK7wQJRME/P3g+yDRivHfXGBbAeKyH+RsN2OtQG1FucMAeSx3i1MqWfE1lbplbh9u
	 HF6e/tftlRmmButPNn+kvGKsXj3XCAdsNRDKQg/3VkDUuu7cZPQC+MTlaHSAOGjgEo
	 v1F3t8hjeKDxo/RM0JQxiwbHTTAAydCyJuGtE+VE7dssIxSPdmRe2aadhk3/xD8O7T
	 9HTWYtnKdXd815wyfYHNo7To+ZUe8hsoGTFuSCvAkO/1P1bPhOAvikUd8pU8s9KNVN
	 tsJ8IbGstUaSQ==
From: SeongJae Park <sj@kernel.org>
To: Philip Li <philip.li@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	kernel test robot <lkp@intel.com>,
	Suren Baghdasaryan <surenb@google.com>,
	oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [sj:mm-new 42/45] ERROR: modpost: __ex_table+0x1584 references non-executable section '.rodata.spk_ttyio_synth_probe.str1.4'
Date: Fri,  8 Aug 2025 10:11:22 -0700
Message-Id: <20250808171122.52633-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <aJWU6RA+t1XpJLY/@rli9-mobl>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 8 Aug 2025 14:10:49 +0800 Philip Li <philip.li@intel.com> wrote:

> On Thu, Aug 07, 2025 at 08:58:05AM -0700, SeongJae Park wrote:
> > On Thu, 7 Aug 2025 15:16:46 +0800 Philip Li <philip.li@intel.com> wrote:
[...]
> > > Do you want to just ignore mm-{new,unstable,stable} branches, I can configure the
> > > repo to handle this?
> > 
> > Great, could you please do so?
> 
> Got it, this is configured now.

Thank you Philip, I also found how you did it:
https://github.com/intel/lkp-tests/commit/1d80cffb312355044007b6e453c08a48a1

I will send similar PRs in future if I need such changes.


Thanks,
SJ

[...]
