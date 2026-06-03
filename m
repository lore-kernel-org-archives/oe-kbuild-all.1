Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8514337189C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jun 2026 21:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780522400; cv=none; b=MlvVs+3cjQ/GBNDmbwS2PjecNrHiViFBLg1dvWblMr9gZYymTj6jJCr6d26HkxonCbtIFfJss8ngjAzcw03dbrb347MMF+Ie/TUkLp4CrupqgFE8Z44FDgtbqqougsnFMRXXeBOLlBLAtGeFLxhLe/geenGUwdcEX6aeH5bE8kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780522400; c=relaxed/simple;
	bh=xnvs8KjV5pF9ZCFSfWtVOHEqO4bK1nJBVzauLKBJns0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=AEj7nDU+ZCncG0Xr1Ezem741E498Lh2wq8hoGX1mG90I5RaREdH0twuFs7Zm16ABVv1N1yVWkvPv/b+oTfhhpEbGj+3dyGLikoIMFbaPX26aeDM/j/dVbwl7Q43BiGmEUD1SpO0HX2XmDctiBudvMwLp4BROop/lnmGkhq0dHLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OtUqycBw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OtUqycBw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 473BC1F00893;
	Wed,  3 Jun 2026 21:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780522399;
	bh=xnvs8KjV5pF9ZCFSfWtVOHEqO4bK1nJBVzauLKBJns0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=OtUqycBw2LKaVVUc5wyCZwiNiTXy+qU8+64pZoKvSaiXoWY4Os6d3UTgibYnwJVeB
	 msnp+5e6rbeOK5fR5BLvhC0vxVBDnOnxawqHK+C5V31atY2aTOVFsWv7kM6hsFjRjb
	 1MPBBCTc9QYDS3N2euTgZsRf+xXEdd9Emx4g5HzuiUpsNLtGN7wr7DQzy86ibr041d
	 gCx6ovQLJP0qMP/OIJ/a0C3nfMHvK5iiphmlPt3NPls9aGi9xJzO7GrX8dUMP8wRxQ
	 OpsvxTvqaIBByOApn98Q0Aww+v5o8gz8UyaK66e4twH2u1e/3lrkfQGKTT9P6nsqoN
	 Zk1Va1xMOpo2w==
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jun 2026 23:33:16 +0200
Message-Id: <DIZQIH15U6B9.356RAQNFTFGEA@kernel.org>
Subject: Re: [dakr:drm-lifetime 1312/1329] Warning:
 drivers/gpu/drm/drm_gem_shmem_helper.c:174 expecting prototype for
 __drm_gem_shmem_release_sgt_locked(). Prototype was for
 __drm_gem_shmem_free_sgt_locked() instead
Cc: "kernel test robot" <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>,
 "Alexandre Courbot" <acourbot@nvidia.com>
To: <lyude@redhat.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <202606040434.JoDqxPvu-lkp@intel.com>
 <72d886c09a54b7263967c212cccd43d4b52a9461.camel@redhat.com>
In-Reply-To: <72d886c09a54b7263967c212cccd43d4b52a9461.camel@redhat.com>

On Wed Jun 3, 2026 at 10:56 PM CEST, lyude wrote:
> I am extremely puzzled at this, I have been running all of my compile
> tests with WERROR=3D1, including one I ran about 30 minutes ago on some
> patches against drm-rust-next and haven't seen this.

Hm...did you try what [1] suggests on drm-rust-next?

[1] https://download.01.org/0day-ci/archive/20260604/202606040434.JoDqxPvu-=
lkp@intel.com/reproduce

> I can send a patch out for this immediately, but I'm not sure which
> branch I should be applying it against since it looks like this has
> made its way into dakr's branch.

It should be drm-rust-next.
