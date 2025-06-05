Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965101C6FF5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Jun 2025 04:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749099525; cv=none; b=SKG22MvkUvky1/54PQdh79n5Kqt3fnDI9H+V9xwi1fScusdkMqu5UnaAT2kox16rwDfAcAEZo3z9jRtlgzk6EWwPFdKYIQ1K3puhE8W5zpaNR3TacOsyJ3N+HusvBPM/GsruT82srsLFoVXHqd0mN3y4R7b4Uw8WVrjfz7im0P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749099525; c=relaxed/simple;
	bh=fj8LN2mnDTFOZh3iwWAWyaW+xepnuETuw152jVEjAs8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=ah7nPq8tgXEzl92X1WJQNahs/Jw0diAnNr+y9Lo6DJQeBLaQngDo8s1mXOi9cPzYIv1LyXUkHc8ubm5zcEGFZZUrY+SLBANJTPBM3VO3xQdDlu+3yRSYxUO0A6DAY6V4UwzozuyIktnZItkXwjLrfxTMhLOT7TZpgJmSs6zRvDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TyqMyUNE; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TyqMyUNE"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-72c14138668so108930a34.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 04 Jun 2025 21:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749099522; x=1749704322; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mgFmUpaLbu3snZc7ueu/9kJ5IZgsr4RcaPHlBaXrARo=;
        b=TyqMyUNE0d0tzGNqQh3gc4rppQ+zHlT6CXQDwuD0UEVuNco4qhW9nxPQszj0unpQTQ
         +iO1DJCOJ7v+L9qumV4O8iZWz1F9y+HtcF8pPofe3rx45iXR8mmCQDMlfc4n/jrBlpMg
         PYErvOMX/5+ugGiOk/d7qSKJ9ThjpghupvGieyWz45G74S+nt9R5ZDV3s4Amgfc5tSgp
         ++BNMfMfXp2ymsXyThz9oY5dPn3Em5mRRpn2n/vpuo1uoN8dymVvx+/V9K8Ek3YYfAl2
         qw+QBYTM18HP63yOfKSZajbK+oCp0rMtT6vNc3ajlqB6jRsK9mU4UES/HRod27fXs6DD
         qXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749099522; x=1749704322;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mgFmUpaLbu3snZc7ueu/9kJ5IZgsr4RcaPHlBaXrARo=;
        b=db0M1ErybPOHxJzOQ05yA25JRDj1S7LCJfoFHrr0m4PLI3mYhve99hZr/O6MunCLFs
         wJNaVKZqn27hFF49NIjWIcdkU1Jgt0Je6cJKN0NrrWbNYzI/DhVck7v+vgSNT2/Y6aRt
         2m6UPkTW2eg/58wguNnH3DmzGT/vdVoVIYF+FJ7Io3Vn42DcvqHARakJDEy/h6Yl+Ao/
         cgS0T7xWXqMqTo/Qa9vYNHhT3EmlZfQEBr9XBcFRSauSjwsyH6E+Q6iOunTbrDkKe/Wy
         +pZ5WiTyf8zO2x9mPd5kFfmxyA3GW/gUq9iV+BCfjXiM+CCbI+oLkxu6ExFi5J2zicZW
         K+9w==
X-Gm-Message-State: AOJu0Yyksbbze4uqx/ezjj1TKgjUGbK31ZjxQN56W7ilJAb70655+Cgh
	ZGvbS8OsUCO/5QUISjpCynGdWq9moIo+LqwU8fGK7gOyADgBnJwK9B4sMHQBZeOZUIgADO8quc5
	R6Aj/GtNF4SpUWhwGQdfccLALgAfOsladPXum
X-Gm-Gg: ASbGncsUKL+BAkKmJSgQBEujd6uNiN6XeeDuk4ka3gb72w9v3ilUav9PAHGfq6S/dzG
	iF7xkXX22uPnfjlUBqJcseSu+OpkrVUsQazCYZxYZSym55yrSrf/NO8WAiv8DV/ogQNz+ObbfGo
	XknlO0/pACW0OCmtz6uSSBNaKdTpYeP0T3xl4IVrb+x8w=
X-Google-Smtp-Source: AGHT+IFEfTXJ5e75ntmfbcYnYYqep4tOS3BwKVJjPSL04zyI02ZPinmGebXlFDrBJDJCkOMXQ5wn/Tibnoa9Ej1WZCo=
X-Received: by 2002:a05:6871:4084:b0:2e9:b6:2edd with SMTP id
 586e51a60fabf-2e9bf5d3407mr3736113fac.32.1749099522204; Wed, 04 Jun 2025
 21:58:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "David F." <df7729@gmail.com>
Date: Wed, 4 Jun 2025 21:58:31 -0700
X-Gm-Features: AX0GCFtdUWxKHlgfZOD-biC-DP_LBXDpirH6NdMUHZy7NoOwm5KIHmAK2g1pL5Q
Message-ID: <CAGRSmLtq_SM-c0LJLafBjdbGb9GEau1_zLiQETpKgTUg=ZAfiQ@mail.gmail.com>
Subject: Unable to build linux kernel 6.12.32-64 on devuan i636?
To: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

I always build both the i686 and x64 kernel on my VM which has changed
through the years from debian (several distros) to now devuan-chimaera
(couple years now). Last build was 6.6.x but now jumping to 6.12.x. I
can build the 686 version however, it won't build the x64 version and
gives me a dependency issue.

At first it was gcc-x86-64-linux-gnu, libssl-dev

I first updated libssl-dev, then the gcc-x86-64-linux-gnu with apt-get install

It now just says it doesn't like libssl-dev but it's installed and up to date.

pkg-architecture: warning: specified GNU system type x86_64-linux-gnu
does not match CC system type i686-linux-gnu, try setting a correct CC
environment variable
dpkg-buildpackage --build=binary --no-pre-clean --unsigned-changes
-R'make -f debian/rules' -j1 -a$(cat debian/arch)
dpkg-buildpackage: info: source package linux-upstream
dpkg-buildpackage: info: source version 6.12.32-amd64-1
dpkg-buildpackage: info: source distribution chimaera
dpkg-buildpackage: info: source changed by root <root@devuan-chimaera.acme.com>
dpkg-architecture: warning: specified GNU system type x86_64-linux-gnu
does not match CC system type i686-linux-gnu, try setting a correct CC
environment variable
dpkg-buildpackage: info: host architecture amd64
 dpkg-source --before-build .
dpkg-checkbuilddeps: error: Unmet build dependencies: libssl-dev
dpkg-buildpackage: warning: build dependencies/conflicts unsatisfied; aborting
dpkg-buildpackage: warning: (Use -d flag to override.)
make[2]: *** [scripts/Makefile.package:126: bindeb-pkg] Error 3
make[1]: *** [/usr/src/mydisk/kernel/linux-6.12.32-64/Makefile:1566:
bindeb-pkg] Error 2
make: *** [Makefile:224: __sub-make] Error 2

root@devuan-chimaera:/usr/src/mydisk/kernel# apt-get install libssl-dev
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
libssl-dev is already the newest version (1.1.1w-0+deb11u3).
The following packages were automatically installed and are no longer required:
  libwpe-1.0-1 libwpebackend-fdo-1.0-1 linux-image-5.10.0-16-686
Use 'apt autoremove' to remove them.
0 upgraded, 0 newly installed, 0 to remove and 298 not upgraded.


HOWEVER, I got the build to start by doing this:

DPKG_FLAGS="-d" make -j$(nproc) ${extraversion} bindeb-pkg

It built everything, stripped/signed all the modules, look like it was
going to finish then bam:

dpkg-deb: building package 'linux-image-6.12.32-amd64-mine' in
'../linux-image-6.12.32-amd64-mine_6.12.32-amd64-1_amd64.deb'.
dpkg-buildpackage: error: make -f debian/rules binary subprocess
returned exit status 2
make[2]: *** [scripts/Makefile.package:126: bindeb-pkg] Error 2
make[1]: *** [/usr/src/mydisk/kernel/linux-6.12.32-64/Makefile:1566:
bindeb-pkg] Error 2
make: *** [Makefile:224: __sub-make] Error 2

So still stuck.  Can someone help with what I need to do for it to
build the x64 kernel on i686 linux like i've been doing for over a
decade.
