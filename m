Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D041B349B0D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Aug 2026 04:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152306; cv=pass; b=sA5wXAYq8Y5QFbNhszX+sxzVnfbNJ3IDY4qjuE5RN9MthV04la0cIbAlI/sTAjPEVfzmg0HAjZRAPx4b7cIneTa6wCGoobJbI2gsF5Jy+IkbhJTkhskVZNmQ6VBSovjOG0B8SIVDurJsyBPAsODYTLxumL4odGG1sVPo4ETVvTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152306; c=relaxed/simple;
	bh=7d3RzoLYdcXvAJ23J+J4rZPDyuFpwavzVHorfEUe2Sg=;
	h=From:MIME-Version:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DxU/Bxf4gaNpvElpUVLu+98pQh+bUF2rRyq+Dt3dC/0daMPLfCawI/diu7Dck4QTGMoO+DWkk3iUoWgW7eu4nAv7gefmbCr+KJKm0IvYu9VcQAIQsCA2n3p+A3sf3Fgdz+mzv78xJpLhUM6br8WxSj/srodlebay/zbqZYP4bQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nMmp02s6; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nMmp02s6"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a18e24ad25so3529629a12.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Aug 2026 21:58:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788152303; cv=none;
        d=google.com; s=arc-20260327;
        b=bYrZG/Qy8NN2J0PxLHNSiszlGCboX529Xciedpp1jnNvJ/jYJBheJzWZXtrir0ej5M
         s/tCRd9Bfo7dMjPw5SxcbzZ7CTBtUSDqb5g2Fh9jio0y3aW9VNruqrbD93XxKDdUkyby
         Mtj8a2rFl19RTft9ENYPduSjwV1+rxHC8n3q8sSv3BIuFLw0nko9tX1bkLpMkVWAVq7/
         xoYIPtmtNx3FVqL/sX/CqlNVSvq+aNlkNLJmKluTkloz1v6silTtsANNnq7EIzZBwg4d
         kdG4LUFVI3CUx1Ell1Fm54DT83SJY19NU5hDcexJ5b/9HZIYKqyk3fnSxsXx1svC/kmf
         9EFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=7d3RzoLYdcXvAJ23J+J4rZPDyuFpwavzVHorfEUe2Sg=;
        fh=9Qzo/MmqeGHXLBQLInXZjJ+TJR2VLfVDsWEBtmMVJwE=;
        b=SyDU/vgYI5cjeZqnydlWcKJu+JvFnDFT1+gnBIyZNcKlXarLm0cN9RBr/YDAl9sOmb
         qpcniEppAEuuYamJRBguOXfqzGftALw+DOUPqZk5VJgByqrDUDJMoIzLWHQI+lvOs1Aj
         InTFfLpeb2i3em7+vmGRV8F4V1DnzclQH0DQX1Z2Wp0lEa3BWY33uCTf7Mj73KwsVzWl
         Afk6mThNUyK4b55uPaAY7tpbUXaunB6pDww3KisjMgZRSFXNCSEodwk/tvMA9nQ7r2dp
         y5+dOjUr3kHQWejupU05m7vz1uE0ltqLwCTypMbqTI/qM3Mjme6oqB19hPk3TTynqdNG
         ng2A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788152303; x=1788757103; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7d3RzoLYdcXvAJ23J+J4rZPDyuFpwavzVHorfEUe2Sg=;
        b=nMmp02s60TmRAoV7Yx4p/fCSs2JgRPlQyQ3IuYxUpPugOS8qplAzWHoa0JTv+Sx/bu
         wy9MK7/MJJycploa3cSupz8nMX8K9Ow6CkC6EoNODu+yqlTt1GAV21txUuRzNMVCZfKr
         nowvA0tBJZdERPIosrUy/IF9lX0X0++WwYi1neo4e9K9MT35G/DqPKKpkRTeqrQBGmOh
         fpQkGA2lJAwEAuM4/kRK+LR4vKFSxwV2lB9luovDP/KOgkNbtOI+XEDXM/t1hCgI53Cu
         6nPLDRWxO3lHkETcVE1/C7R5WzfvjZ+sS4+pU06cg/2AUNDQriFsNFpP6sltAmbKvy7O
         EM+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788152303; x=1788757103;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7d3RzoLYdcXvAJ23J+J4rZPDyuFpwavzVHorfEUe2Sg=;
        b=ZHWlcRyZMNYSBh62GftffnkLYAHlAQqi/Da9PawjcYmJJxRKGaKAfeOKaty8jsk6/V
         qG+aO+K66cK/sx5UwpHp561r6AVdx2rP+UcFv5c3QjM52Bl+mYqRMzcQgLCvqJoobkl8
         LP2gh5P+dDXo6JOAmLkMfxTTeDGT2aoRsnJ2XkJehIHctgZMeB/bm/9RwitUsquJyaXW
         LOFlSXlfYm28U/MDHclD7/uABF9fdsA8Cjqu67VPuoRoon2rOyV8pHNU6RoGecEnGxYW
         NQ4BDQAN4WJtDsaGvPPJ9Z0qbgtYIlAEb+i/9B35bkQRePLvlN5gSferaZaiTmc98dAq
         rxBg==
X-Gm-Message-State: AFuF++kpwnwMZb9gQHNBOi20+agytOocyxsW7HjlVx8rEAOOnwXwtwP4
	PyRKBcXEt9CF1QPuN6IsiDZlPRxtX+LgC7o7apmU0cfjYux631Oq590Hk3wXuivbQE0RwcJ9mUJ
	SNFGeTc4OIRpYsT91LCr/Prurn3S6u9c=
X-Gm-Gg: AYBFou0pg3sEw6NZqZls9MwzSEbdXTEpmD+LcGLwA976zVhME0Yo2wH8Mg6upUu7Etm
	1kvSO9hjStbdSfpZRFMLMB5PZ2T+GHQzTR/Q646GsrY00CxAgYhApLpw0hGVx4GujKbxA4Hl3yQ
	jSoeyFK9lXTkdY4ZWaBRjyZ248CFiGClxehgm3vdfychE6u66E3z/aPPjaUpN75docyY/3lCkSL
	6wIN670+Cei+EKdG1U3UmmPkYA/D7c+Lnlkhjx9j1JY+LJ5ZyZ3OYvnLTDiy//SkhiNBeSzR6M+
	DR8sAkcyWvMJhBL1mOmto1tXllYsB1HhOa3IOktnw2QCmBqapR8I5i4Oktg82qql5Y4GW+VYEXH
	ngIF/DbHAGA+E
X-Received: by 2002:a05:6402:51cc:b0:6a5:d7cd:fb9b with SMTP id
 4fb4d7f45d1cf-6a60d1591bdmr14427713a12.0.1788152302907; Sun, 30 Aug 2026
 21:58:22 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 06:58:22 +0200
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 06:58:22 +0200
From: Xinping Zhang <zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202608301649.G22k4ucE-lkp@intel.com>
References: <202608301649.G22k4ucE-lkp@intel.com>
Date: Mon, 31 Aug 2026 06:58:22 +0200
X-Gm-Features: AcwNN1UeeGrvH2ZDcgFXzcA99m8x-7rMU-mPxJYlOhb2Nt_uqZemX-ImBk6Qau0
Message-ID: <CAH=xXfFRnR5LVZaNNd-c1GLF8tC-B-T5ZRdbG_YVim_mz9eNyQ@mail.gmail.com>
Subject: Re: [chao:feature/subpage 1/10] include/linux/f2fs_fs.h:431:31:
 error: flexible array member in a struct with no named members
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <chao@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Thanks for the report.

This is fixed by using DECLARE_FLEX_ARRAY(struct f2fs_sit_entry,
entries) for struct f2fs_sit_block. I folded the fix into "f2fs:
describe SIT block layout dynamically" for the next revision.

I also rebuilt fs/f2fs/ with the reported m68k randconfig, and the
flexible-array error is gone.

Thanks,
Kelvin
