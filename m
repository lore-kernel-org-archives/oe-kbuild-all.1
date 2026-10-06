Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60703453A59
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 14:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791296112; cv=none; b=Dq8P+WN8ZISTNYoW2yXg9y2AOhw+1XVl0kZXUkcoKab3QieUHBGOPkmr0wHtClCOqC1P42Ly4AJJt7wRt9WmWuF7ktPoBtNQNPvDZds9U3Xg4lrHjNMqNtzlPphliicm410RNqLc2+KB85FO34j7Kr58zubk7vkHZEh8RJbNZpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791296112; c=relaxed/simple;
	bh=Rt6mt+rUg7z2PHVSGdPFUQ/pk9erp8SyrZEbytVeoCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c7OIHurqIGKz/JMEZrf3VwpcCyblLcbVkHwECMbEEZ2mOOnBng+NQcw12aI27dpnQAuqDs+Ke6ksbmKQz1mqWbr2nQvGZvGP1p4L/0DQibLD/NtG5AUbkfaGl79C3cbKapCpkwzUPMQ4F4G5FeKZI743EkPcR/f7J18RgAybcm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hammerspace.com; spf=pass smtp.mailfrom=hammerspace.com; dkim=pass (2048-bit key) header.d=hammerspace.com header.i=@hammerspace.com header.b=Gj2AGKrF; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammerspace.com header.i=@hammerspace.com header.b="Gj2AGKrF"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-8241a56cd70so914204a34.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 06 Oct 2026 07:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammerspace.com; s=google; t=1791296110; x=1791900910; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+qv7nydr2TofzQiHRm5epInETtpL+MrcetUt6kH6GVE=;
        b=Gj2AGKrFxHAS0PlxmpxcEVsDXqwPS3yredbPHQjnD9p1eClGIczYx0PnScLWOuySYd
         Pel5SY4dM8+kwZjG2AfBWGo2aYl64V0976IvkFQ+lSAcF26zQlRd6lyIezaPUqCYQNpc
         03uB6DYw9dpUCl+Lvj3JQZZ6xT30c4rV1fqGbw6Aic+uHkVIRT/zqBXHsxcMjH8puzUm
         Umr2Td3GS/ec1r9USJUiHFc0BsvFl9aLCqr/aUB+1yNBxzvfFkrlpTIVG86srFdl7SKH
         C7UgsysIp0jdVM20DQ0WiXaSuM0r8lQnSoMd4difTdYQvWSrjNLkwz3lM/YCZxjwbve+
         357Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791296110; x=1791900910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+qv7nydr2TofzQiHRm5epInETtpL+MrcetUt6kH6GVE=;
        b=wCMdiTrd679gB2tzNy0LEbfhlASkuBZetGApplWRVi2KSQ7jI2Wnyn0iNxfr9Y2uDL
         bJ/QriEORFlzhtadTUYJZtteCWUSHtfeLB8z+dOuEbGnEiOjlkapWjw+2IoJJzIHTgbA
         6/DBMoSWJA8eggPn4VAKhyVAbxfyiQ8GC93aIqbuQN9zPdXABXF9XLeKantVG5iQisnL
         5Lazsrh9sDGj4AQNenZkYSCyjQeAnRyrY6L4VPgTXOZk2Xf6GAaAZgn4jH3nQPD+8Kru
         70l986xf5mGJ++ntDzFbrRRuNmi5NIZT2prrDKmxZbCgoNoISUQssd+HAAlB6AbzRtzM
         48JA==
X-Gm-Message-State: AFuF++laJOuGCnAOoyoU4gvv6SV/lyoa+NX+9zV2qgdBl64swun+XjJO
	ZhrduDkqg9/l0hnQjcn2f+4+g4Gt3GvTAcIX46/1ObdWyGy70KvFS4aQzECL2NIBBbI=
X-Gm-Gg: AYBFou3Cjjmp4vZTVEmHJbsw5BJgEO4Ws00Brhx1Ngs2Kz4SCrhaa1N/iqfXEXkSQX+
	43onliNPdWEUvrXnjT8qIG+gYYrEUtCIxowrP7+6xlsE5libMTAIxDTp70jmwW//nKs8MaMWPpP
	/VbbyuOex3ZzFHDt2kdQKAm94uKJDif9mrZaw8FkOsbWutOxRZQnxe1WowLt/IcCNaY/gxSJFKU
	nMmHTMFDVz3px4I6ROhvBDXcdsWbUe6R+cZsd5cxBiutE20eSjw2Qr5DrhzWaOlCgonpAU6YeDT
	CV/5WbPQ4QW+nlaEJpjB3dtpKwaBoV/mGimzDt4U94zC3FgTWryLRoDYzmc8NOMg4YrYHY1iz6u
	X4SGAqI4kH+wa1eoW9m8ijUvtEcQFhSLdAuEcgEG+2THnB+b5HetwKg+Qde7Diq/6PYSY66Tsue
	OAGUKCXV9/pxqeQQ8oKAI6WQL5vtdGoWPLKHtoXPqZ0HV7JRfMCfjnazf/w61vAm+4XoJ6q8KZh
	TLAnIOZW2KgxKufsxAfzaPpK+6nrGx4LTUNByQSVg==
X-Received: by 2002:a05:6830:82be:b0:81f:8a6d:7b52 with SMTP id 46e09a7af769-828a3925c60mr1425975a34.24.1791296109909;
        Tue, 06 Oct 2026 07:15:09 -0700 (PDT)
Received: from bcodding.csb.hammerspace.com ([66.97.168.37])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8281acf807csm2433600a34.0.2026.10.06.07.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 07:15:09 -0700 (PDT)
From: Benjamin Coddington <ben.coddington@hammerspace.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Chuck Lever <cel@kernel.org>
Subject: Re: [cel:nfsd-testing 295/295] fs/lockd/svcsubs.c:428:5-24: WARNING: atomic_dec_and_test variation before object free at line 429.
Date: Tue,  6 Oct 2026 10:15:08 -0400
Message-ID: <20261006141508.692417-1-ben.coddington@hammerspace.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <202610052357.ZfzEOheQ-lkp@intel.com>
References: <202610052357.ZfzEOheQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Benjamin Coddington <bcodding@hammerspace.com>

On 5 Oct 2026, at 18:00, kernel test robot wrote:

> cocci warnings: (new ones prefixed by >>)
>>> fs/lockd/svcsubs.c:428:5-24: WARNING: atomic_dec_and_test variation before object free at line 429.

This is atomic_as_refcounter.cocci suggesting refcount_t, which doesn't
fit f_count.  The count rests at zero while locks hold the nlm_file in
the table, and nlm_lookup_file() and nlm_traverse_files() increment it
from zero, which refcount_t would WARN on.  Whether to free is decided by
nlm_file_inuse() under nlm_file_mutex, not by the decrement.  The commit
message notes why it is an atomic_t rather than a refcount_t.

No change planned.

Ben
