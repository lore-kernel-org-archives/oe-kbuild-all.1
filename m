Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692F3221FD0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 21:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765488719; cv=none; b=Qhl4mbqV15enKop9ZT6w/Y6Kkd+jrHgrL3bI1eo4gBrtsNAenpA6V/L/tIjxr3JJkQl1OVE6d+wsi6tScCGUED/ad3ztrJTEqiuowYrqsZgBzCEyp1GPZuAThTKyv15jnwhCaZfQwd0jWCFELyxPbhjvHKdk0W8mHpaJpXMPthM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765488719; c=relaxed/simple;
	bh=+8V/Cw0Bh6WMEocnm8c5kr6IwDXC2Uo4UHlqpDCQ0T8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vcerik35JrPJgR49KOMmCXiDYM0FAzLq5/ZA1bcT61MedrMm6RTIwMVQ6q9UC1L3DtjoCKbez8vmhTown2H9L8zGZBTmfV+gUyr/ozOIUJ7lr9/ljmgRR1pwiDprm0/sCTdIZBp5gPElKColWajs+ZAsafZwjDdHxrK14sXd/+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XROVW0tc; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XROVW0tc"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8824888ce97so7634646d6.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 13:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765488716; x=1766093516; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Argb75K7PFGjqTuhZtNNZeNloHzK5kKcxCpxByy6XzI=;
        b=XROVW0tcMUSXBLciGEEK4ZOPfWp1BefzjOZ+XvxxYFPXrDYZTUQ9mIWXWCwbx4WKYP
         9ILPRtIrB0H16OOStG+sC3AFP+2qQz/qoPkNXdpPTwrNI28/vH9ZOAlRcYCPuWq6VLye
         5GUuG329j+fGBSQuBJZvUX9tPOR9ei6e0iQGWluzAc47iEYEpYFRZ6ZNW5Kl+JF6L+I8
         aQqRbz32dUsKALfL3sAD1E4iLSoRt7B/UhN+Etk5NycSTFI5gkoqaD7HXwwcVoBuPgEy
         /Y/lwurSyWue470MPtDemoOiZOgo0HdNUGNfwCP6KwJapidYCtgxsrVdv1fT0B75tRcQ
         UIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765488716; x=1766093516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Argb75K7PFGjqTuhZtNNZeNloHzK5kKcxCpxByy6XzI=;
        b=j/Q7k2/vsurebaB/feXjryclPeoEMxtZ58ZBBDzH+mitQ9qaO+gosAVFrDWULiscvI
         yIH9AIxND56U5NE+jxLhmU3g5xnR3FrL/SPPJ1SM8EJOxpu2LAhNo+AVjMJ4j22dWUT8
         in6JbGLf3kgKiKCyBoJ6GeT2/dcp/et6G/8DnMhc4Sl305fKefsQvhWrcASHw4oR0weh
         P8umStGUrD8T6ZXAy5gYwRbt5mDtDtKZi3xokFayB8PNM4yCpIMWZmE7dzNQEIIYWG3o
         mOtWP4q7msy06xyEFMz9beacT25Ekoggp7wCGIyovmmE5suE0IzDcl0y34ztTTGy+wsZ
         Vncw==
X-Forwarded-Encrypted: i=1; AJvYcCUBKqRSo2ScikeqkHbZcFasGBEsBAQmnWuF592uKVnDI91XUki6th6stWV44F3by39cIDGpkg0Hq9vpxnXE@lists.linux.dev
X-Gm-Message-State: AOJu0YwR3wYDc5Zk2BC6jpm6FM0uSVHRqebgJsD8jQCS1DiUx4Jvq1or
	VhhT7nL4jpKZ7z65GqUAM9cR+ZHiXj13cC4SUKp7NEALv3X7xq90LNzt
X-Gm-Gg: AY/fxX6Z0HXTyBmBCchQoi3VMp5pE9v6/FFlDZmMp2V/S4Er8jW8X8RxLgm4HFdh6pn
	lORztbAW6KHCJv6OOoR08qalxLhqnJhb4vTpUCisl54noLPfYHvZoOmc95vUVR7ouSFi9iD7WhS
	e49o41otidujMkFvvxj3OEZstIUuy09nhBB2o49t29MvI2QTQQHFa2kSkb8ddGj4uZvRvIRBRXz
	rHF0u0BICvvOu+o/q0rxrWzVdJpP64X/qhYtCcr2HFXH5wmjt6zR6xIJ10zaO38fFOAHMHvwYHB
	kKqMsc9pOKPkWnh+b4eQDRg1OZwmg82jMHKmRMHpxi54uHHkT9Lg7mm/4PBZ2QHsVyVnSMTMf4I
	hE7QIZLDS39Pl4tmd2f4Ymz45SAFCmHppqFRgVewrt0ezHKoCweC0FyKUj461ze3iSainKXRzvg
	SJhL1Sa2yOJ5Te4aPF+YBGe5yEe2ViTzcSJt1pMtdgzToaOSvhCS82m86OaLTlAII1CyaqoUOjB
	gHP1TAInUbJPQM=
X-Google-Smtp-Source: AGHT+IE9l+7eBLqzvQpUem+VtoKLcnoj4dvB6X0XnQWCEgiLwLnO1jFohKvngZ3bA3ksgKNI1iouRw==
X-Received: by 2002:ac8:57cf:0:b0:4ed:2ff9:b325 with SMTP id d75a77b69052e-4f1b1b722fbmr103008541cf.59.1765488716247;
        Thu, 11 Dec 2025 13:31:56 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8886ef16adcsm31052836d6.46.2025.12.11.13.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 13:31:55 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 34ACAF40068;
	Thu, 11 Dec 2025 16:31:55 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 11 Dec 2025 16:31:55 -0500
X-ME-Sender: <xms:Szg7aU96819Jry86OhqY8icvHMeWlvk45tRqLtKctm5bBgJa_OcDZQ>
    <xme:Szg7aTykvZ06ht-q1oL-0TuiuGH4Kuh-9OgadI5ZgPcWvYMfvKzCfTHaPgPWy3jL1
    XnYI6PzAcGIRduesnKMWcIByWRzZofWclZSh9fnUyNCaFg6EOF6HRc>
X-ME-Received: <xmr:Szg7aRv3ZgRfMLw0HhsPxa23M3TSVDD3q3rsFliaAkP8P4e0N4b9WXH0m2QBYh9FrAhUb_esBAFtcCCkOIg13-Jc4B1yDInWRfU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieeflecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepgffhffevhffhvdfgjefgkedvlefgkeegveeuheelhfeivdegffejgfetuefgheei
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
    shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
    hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohep
    vddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehpvghtvghriiesihhnfhhrrg
    guvggrugdrohhrghdprhgtphhtthhopehmihhnghhosehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopeifihhllh
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghoqhhunhdrfhgvnhhgsehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepmhgrrhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtg
    hpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepohhjvggurges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilh
    drtghomh
X-ME-Proxy: <xmx:Szg7aa0szGI6HWzIwSUqurT_QD0-rUQp6sgGbgQqiLAj3Vwz-t6q5w>
    <xmx:Szg7aV6BSDUo4HmNwia3h2woheWj50XJcDW4G0BFN6ulZPX2QbCvYw>
    <xmx:Szg7aUM6kziXWHqMTT63nXI-KHcn4Qg4aHSipuu_W8OnHfZndEZ4dg>
    <xmx:Szg7aREF-8euH_vlesl6wTc_zsSWrwCSXehFRI-TBfAC_lxnb0MqkQ>
    <xmx:Szg7aQ0W1sBaO7hh88b93WxPRwb3n-7l-zpBMH21Oa-pbOzDrvjTGsiY>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Dec 2025 16:31:54 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	x86@kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] rust: sync: atomic: Fix fmt warning
Date: Fri, 12 Dec 2025 06:31:33 +0900
Message-ID: <20251211213133.56265-1-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <202512110753.8B3YlvtX-lkp@intel.com>
References: <202512110753.8B3YlvtX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 14e9a18b07ec ("rust: sync: atomic: Make Atomic*Ops pub(crate)")
introduced an import ordering that rustfmt disagrees with. Hence fix it.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/lkml/202512110753.8B3YlvtX-lkp@intel.com/
Fixes: 14e9a18b07ec ("rust: sync: atomic: Make Atomic*Ops pub(crate)")
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
Hi Ingo & Peter,

Looks like I missed one rustfmt issue in the commit 14e9a18b07ec in
tip/locking/core, here is the fix. Feel free to fold it if you want.
Apologies for not catching this earlier.

 rust/kernel/sync/atomic.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 3afc376be42d..c07a53f8360b 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -21,8 +21,8 @@
 mod predefine;
 
 pub use internal::AtomicImpl;
-pub use ordering::{Acquire, Full, Relaxed, Release};
 pub(crate) use internal::{AtomicArithmeticOps, AtomicBasicOps, AtomicExchangeOps};
+pub use ordering::{Acquire, Full, Relaxed, Release};
 
 use crate::build_error;
 use internal::AtomicRepr;
-- 
2.51.0

