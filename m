Received: from unicom146.biz-email.net (unicom146.biz-email.net [210.51.26.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3F81A5BB4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Dec 2025 01:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.26.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764813294; cv=none; b=U5R2BvWX6lQmTgOui43NW/wPPFKlC+gZaR2tiFv/PDxqUzkK1D7jOubCRs/i1/v4jnCROk6tX3cjkJgz9gysUeREM8KxO8gXrGW0uqzUm8E1klIi+gB/E5CnKDkvfrUpkAMKVetZiT1sa9hbB1KwE6ZrRBYOINe6T76jOuqui5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764813294; c=relaxed/simple;
	bh=H/aelW+VX9RhDZJN9KXY4QdCwwVUmJgB51RhyA3dKM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b+KgARparK8SpfpuL/is5Q9z/97NLwfWXwEY32GRIbbcZSV9ockeDSer+XxBJnr3DPeA8Pl0Na+1KukWYRfsLBDzTVDdnJ0P7rnAJ2EI+GAsg4RrTR2dTwSV517GNzWiWjGFtaLfL1RkZfExmfnl7IqY4ZAPBrmVBakGGWL+oEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.26.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from inspur.com
        by unicom146.biz-email.net ((D)) with ESMTP id 202512040953359889
        for <oe-kbuild-all@lists.linux.dev>; Thu, 04 Dec 2025 09:53:35 +0800
Received: from localhost.localdomain.com (unknown [10.94.16.10])
	by app7 (Coremail) with SMTP id bwJkCsDw0fWd6TBpNPMGAA--.18854S4;
	Thu, 04 Dec 2025 09:53:34 +0800 (CST)
From: Chu Guangqing <chuguangqing@inspur.com>
To: lkp@intel.com
Cc: airlied@gmail.com,
	chuguangqing@inspur.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	oe-kbuild-all@lists.linux.dev,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: Re: [PATCH v11 0/1] [DRIVER] gpu: drm: add support for YHGCH ZX1000 soc chipset
Date: Thu,  4 Dec 2025 09:52:40 +0800
Message-ID: <20251204015240.48860-1-chuguangqing@inspur.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <202512040420.tMzo2lns-lkp@intel.com>
References: <202512040420.tMzo2lns-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:bwJkCsDw0fWd6TBpNPMGAA--.18854S4
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYv7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aV
	CY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAq
	x4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6x
	CaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwAC
	I402YVCY1x02628vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCF54CYxVCY1x0262kKe7AKxV
	WUtVW8ZwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-CM-SenderInfo: 5fkxw35dqj1xlqj6x0hvsx2hhfrp/
tUid: 202512040953368c0829107949565288e22248bcf4b911
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

We sincerely apologize for the compilation errors. The module was not enabled
during compilation verification, and the old module file was used instead. We
have now fixed the build errors. Could you please advise whether we
should submit a new patch for the changes or resubmit the existing patch?

Best regards

Chu Guangqing

