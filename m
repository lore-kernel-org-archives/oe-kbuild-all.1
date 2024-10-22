Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F62199EBB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 11:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729597269; cv=none; b=i+2Xxv7lujFnzKfb9Gfud37Xp4SMmuE0psvy8d9w+UUju30OPIAeX2dWCuBxZ4HRHO9QTPIeVT79b8I8ZegrCjLefPVpu2Tj7vrE5uLaDj2zq/Pg9Z1ZvejL3LEb7VHL7mBPKZrtzfhJiHBtoBlWM2KNlbsFoPi1fSmdGnorqIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729597269; c=relaxed/simple;
	bh=eLo6KKnV0jiuUsVhg/DAht5IgwkShpEtTNRrdJLrj5w=;
	h=MIME-Version:Content-Type:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID; b=sEn0CfdEc1B/HeHzg2CQPuRk73uBj4E3fYbBro0aPv7q+6p4Dx/qv2DQ36/CAnNJQx4dP3sWmoaaQoPORIq7UMvIxU5UkKHLcTDg/FMeNKmVBkSCFqZbdsd5kqvUYLdW9CwU7m7MqyZFs/474a11zVGYmEldIaX+difobqhr+LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=t4wQhTdL; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="t4wQhTdL"
Received: from mail.denx.de (unknown [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: festevam@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id B0DE388EC9;
	Tue, 22 Oct 2024 13:40:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729597259;
	bh=42NzgsUHInBhzJR8uwdBDc1P09sXrmDY0IK37KxgBmo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=t4wQhTdLt5L2ShpdIXNH4QgHQAgrCUgLjpzLqW8jlR4b0e4SSlpz/zIQI84rbFk0F
	 /PgS8ZHmz+EAlnx/RHSMvEoGqa5MzgPkW2yOI2I+zqfteGnOKPvPbJXM5H+FgV0slS
	 tg2xNQLDMRYcJX1yE9Byf5HkdxY9v328ZpZ+W+KeProRc9LzKTY2Y9YMRKF01wl9Hp
	 3MuB2LvY88bpCtU4wnVlWrxO6o6l9xNRx9w6joWgtS9PGBfs6s8e3DQqNgRaE1wl+V
	 32oi7yVeVT3yQQXMFv+NTBtL62k4Fn7Ya99i/yERWe9ZjtEXm/v4/aYR/zVu/9YLZ5
	 mzKjjjgbMN7VQ==
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 22 Oct 2024 08:40:59 -0300
From: Fabio Estevam <festevam@denx.de>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Shawn
 Guo <shawnguo@kernel.org>
Subject: Re: [linux-next:master 4743/5686]
 arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: /ldb: failed to match any schema with
 compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
In-Reply-To: <Zxdl6KIVe+m9IP5h@dragon>
References: <202410220602.WnWrz1yk-lkp@intel.com> <Zxdl6KIVe+m9IP5h@dragon>
Message-ID: <6ac47e3ef3f39504864f8ef10ede838c@denx.de>
X-Sender: festevam@denx.de
User-Agent: Roundcube Webmail/1.3.6
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

Hi Shawn,

On 22/10/2024 05:44, Shawn Guo wrote:

> Fabio,
> 
> Could you look at these issues?

These warnings come from the imx6qdl.dtsi and are unrelated to 
imx6q-lxr.dtb.

The warning about altr,fpga-passive-serial was fixed by:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/Documentation?h=next-20241022&id=fbe4ba6c5c7c6bb61321ea65721e3c937e8e82cb
