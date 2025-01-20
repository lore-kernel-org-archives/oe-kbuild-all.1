Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F941B982E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 15:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737385266; cv=none; b=re6t/tm0PaQHY1CMfLgDrRf/DvZXMxJNL6V2gOPkivKt/CL7zV1UsQriiUBiVsM6GgGuNTzY7NG+eQmMRsArHb3TzjF7JI7yHPXIFVDpux+jb3d4ynjCwxVq66bzEpNz0zncTFLhluQyJMJ/4lBe8ofhhDnCIXcpPLteNmO2T60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737385266; c=relaxed/simple;
	bh=asj/uimr+XiNatLrhqRCb8Vw8BsenYDGBmIhJD4sSzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VYfaiTRTjgrsP7scQ9OL8Fm0slJbSnrS3qZ/XHSeZLBFVXbCib3jRWrGVgDMCQ2OegwOuYoFXGzlWCX+DkOSZXbBX8oiJlJvZl9cqvQDTA4v1/+qVIY2NQfdvdEBtw/pakgLH4IVhd3/bOSWiVJMSFnLvrngSMkgNe9q3IF7aC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Nzq3NdQg; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Nzq3NdQg"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so45454715e9.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 07:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737385263; x=1737990063; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=asj/uimr+XiNatLrhqRCb8Vw8BsenYDGBmIhJD4sSzc=;
        b=Nzq3NdQg6qBcaJPfuIi3phrs8R0bHir7HhdE96lLAp9EAQHbuBf6PVa2TfP/um5L9Q
         u2djgYcy3RFoBToe6N42J58mdsewcpVFKuZY8HWgUV2KsEz7XU0Y0puBP2O/NvkWu2wT
         iZTCDZqqekV0C4/WPo4tjC1nv3Jg2plE2H6e4ChDuLTKadiCrZLXfbupSE6P2NOrVfWZ
         W8h4tKMMInFBpFwqhvD7DGNPk10guIjDeKnflFAgjWtksXCtFoK1J3bWCRJZvRsITayl
         IcChPwD9VHVj4E1IggasBOsc+/+GrsPnJgRAFge+uvJC8kT/TWHesKY0b1yTueYrqkR1
         79pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737385263; x=1737990063;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=asj/uimr+XiNatLrhqRCb8Vw8BsenYDGBmIhJD4sSzc=;
        b=FIl/nG0DwRkzqET6+uii3eB3UiW01/X5wdZHxSZHD/tBL7ec5QUgpGwAklVSr3UCj0
         PeCftb/mbJcjdTsGeY/q8RPkHBoXv1JlxYE6u4CjahIiP2Xsk5MHmLEcMDF3udWazfaG
         XU63O0CrflMlNLj3DRFxWTYCPD6gAYEPTdybURa0MXSxBpXWhpbwn2AeihTBUQvgfmbi
         zL8oEcrVDkINIEZ4ZCzlCNEUlgoBQGqS9IqK+D+WTPF5EjZfvGvW7cx1enHTmZ5naDdh
         gBsTv7RmSr8iykQK0IbODZqUDx29hweGit5aDl1wYbnT9RcCSY4RexhTEWPczmhM+GV+
         Ry0g==
X-Forwarded-Encrypted: i=1; AJvYcCUSht3GK2C8uYlSfkaudS7pL4ACYPCdmA5ldgG3KzZ5MqNy4AfWk5oI+JmgfiH+sDu6c0WdhCvThIgTqZjK@lists.linux.dev
X-Gm-Message-State: AOJu0Yz23ZECRmWD+wm6ii5ZJwPA6q5M32VHLPcWlmtWxvr79som7WA1
	9Z1yGovEoDK7jRL0Yvk1R1SKQg2L+Ett/n1HtVVkjzcZYk4pK2htuZDv/M3Wc2Q=
X-Gm-Gg: ASbGncvdpCoCoOVTdkNMHAoRmkVqyUAyckGIR+54l75pmvh5On8d0K1EatW+z1e5uuN
	SwsYdLp0hbrFHdmhE1mI2Phkh79RvAfPzX/+gZX+bxedvee5hYhPyZg438u6bPw9Pl0nZh/xE6W
	uBrJG69vMsjFuAS817q+moP1jRb4pUgxYEQFSdffF5Y7ta5G9x9MxVbMGLnS9xF//hT3zRagjqB
	wxCwx4Qwd8KFnjjk0n72raYnIqRpL5KO0Sbt1ydDXAvEJ+NijVjWbKXiiiXJsfqFMQ6mN3t
X-Google-Smtp-Source: AGHT+IHU7IKibowjOp5iyupXGNYo2g1aNRGoxZ3HXz6UMwwnNHdlZwnc1ZpPxEGpBn2HUoDdjaC85w==
X-Received: by 2002:a05:600c:35c3:b0:438:a290:3ce0 with SMTP id 5b1f17b1804b1-438a2903f47mr75973505e9.8.1737385262801;
        Mon, 20 Jan 2025 07:01:02 -0800 (PST)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43890408a66sm145066205e9.5.2025.01.20.07.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 07:01:02 -0800 (PST)
Date: Mon, 20 Jan 2025 16:01:00 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Tejun Heo <tj@kernel.org>
Cc: Waiman Long <llong@redhat.com>, kernel test robot <lkp@intel.com>, 
	oe-kbuild-all@lists.linux.dev, cgroups@vger.kernel.org
Subject: Re: [tj-cgroup:for-next 5/5] kernel/cgroup/cpuset-v1.c:397:18:
 error: implicit declaration of function 'cgroup_path_ns_locked'; did you
 mean 'cgroup_path_ns'?
Message-ID: <wb4pz2ny7hzg62j674tl5d24z72axasxpacivwx4mdbze44tcw@borj5ejhdwtt>
References: <202501180315.KcDn5BG5-lkp@intel.com>
 <4ea9fbd6-dc6d-499e-9110-461ed0462309@redhat.com>
 <Z4rHMAgNHCRRpss9@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5z7zzepdgysyonk4"
Content-Disposition: inline
In-Reply-To: <Z4rHMAgNHCRRpss9@slm.duckdns.org>


--5z7zzepdgysyonk4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [tj-cgroup:for-next 5/5] kernel/cgroup/cpuset-v1.c:397:18:
 error: implicit declaration of function 'cgroup_path_ns_locked'; did you
 mean 'cgroup_path_ns'?
MIME-Version: 1.0

On Fri, Jan 17, 2025 at 11:10:08AM -1000, Tejun Heo <tj@kernel.org> wrote:
> Dropped the patch for now. Michal, can you please send an updated version?

Sorry for complications. (Despite I tested both configs, I forgot about
some caching in my test setup and missed the build failure.)

I've sent out v3.

Michal

--5z7zzepdgysyonk4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ45lKgAKCRAt3Wney77B
SVg5AQDUX7DDJhPSr5s2AMwlzl/3ZFdglJ9IXAd8MatXB35QWAEApeIyWJI4fyu1
rl2ZbAjeJZFo63mEJ4hIepFn42EySwk=
=7C1+
-----END PGP SIGNATURE-----

--5z7zzepdgysyonk4--
