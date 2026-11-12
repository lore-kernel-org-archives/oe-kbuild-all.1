Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794454850;
	b=cu3Tmci6CYSR7V1syPBZaAzvkNY8xwAhzj1zlJO8ZsXroCHn70vX3I7MU9pKF+QDBdZ5
	 smnbkeUICtNtG6wOldmSUF9mVt3CDvWc1d9fJRYjo96+3tvKsZmNCP5E7HbZbgAiOe0Cn
	 PD+hu1Esy2MVAVWbOsoMBOLOgrtggWfh0+7EWuhPTpFokBpogECJPU6RmPKULHH4PlE8p
	 HyNZlN3Jjr2MIZUTN5glSbWE0gyGaKjNFPOMayn14RmX01FXLG2VovA9dqNCdqN1qM1+5
	 Ke6EgQHp7myFtk4DB5rzxnQzuLVppmuUG2oV5ki0xh4N19LCYmpJLrUF0eLC26GuprQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794454850;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CYgLt5XHcbwvgrzG4rC1YzZG9p9HiN2HotA+4b2pmb8=;
	b=YCg5Dh23crezZm4wezjhmcqgfUEnbqDtwuXeVe7NmVJoUNJYseUCJKP1h9hARKjNdtSZ
	 f+2IJvAL3Bms3jos6KpBXES/tVMqoJw86QXJMnxHHlLFfszdzzE6awH94JFwTy74i18x2
	 e2206mTqbY5NleT+s6ag/WokXYkUw3cCLod7Q1FGx/SFUF8fmnZ9mtZ7FFufVO6tdKwan
	 LJ1LNsezxpqygETnfJ5ppTzIPlys/6LG2dxiPYqbq5B1S3rufV2v65tG921M+Z6loSCqs
	 hiP633d1qkhjMKUcwewifBMn9PugEDXaJwOQA+q5ZvndFtYV+BaiQsEFHwHNTMjb19w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jfatv2c3;
	arc=none smtp.remote-ip=95.215.58.101
Received: from mta1.migadu.com (out-101.mta1.migadu.com [95.215.58.101])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A341606A321
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Nov 2026 03:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A341606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jfatv2c3
X-Envelope-To: oe-kbuild-all@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=CYgLt5XHcbwvgrzG4rC1YzZG9p9HiN2HotA+4b2pmb8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794454847; v=1; x=1795059647;
 b=jfatv2c3jjkn2TiEFGOjIYEUVVq2d6haF+MZemBeIGV3KavTtFBoqQGbcJ9KSvVtRMAtrEIj
 UgDarjr4U0K3Q2OdvKfkN9ajEJkRcojU3tgUyw07AkBiiSTSKmzy76HmkfbcVW6tpt3MnEN/hKW
 MYjazoEJ2Z2pfEALG5vjJFvc=
X-Envelope-To: oe-kbuild-all@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id c7b652940fdb96ba;
	Thu, 12 Nov 2026 03:40:47 +0000
X-Mizu-Trace-ID: c7b652940fdb96ba
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
To: kernel test robot <lkp@intel.com>
Cc: Qiliang Yuan <qiliang.yuan@linux.dev>,
	Qiliang Yuan <odys.yuan@gmail.com>,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [linux-next:master 3495/6082] mm/shmem.c:1330:13: warning: stack frame size (1056) exceeds limit (1024) in 'shmem_undo_range'
Date: Wed, 11 Nov 2026 22:40:40 -0500
Message-ID: <20261112034040.2753887-1-qiliang.yuan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <202611112032.TMyPU6Rm-lkp@intel.com>
References: <202611112032.TMyPU6Rm-lkp@intel.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the report. Fixed by:
https://lore.kernel.org/r/20261111-bug-mm-shmem-undo-frame-v1-1-e50a95b8f9b2@linux.dev
