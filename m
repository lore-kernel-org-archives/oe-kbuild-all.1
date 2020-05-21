Content-Type: multipart/mixed; boundary="===============5873994128648048896=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: kbuild-all@lists.01.org
Subject: Re: [linux-nvme:nvme-5.8 30/33] drivers/nvme/target/admin-cmd.c:541:32: sparse: sparse: incorrect type in assignment (different base types)
Date: Thu, 21 May 2020 10:25:05 +0200
Message-ID: <20200521082505.GA7587@lst.de>
In-Reply-To: <202005210630.BYr6ZIxm%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5873994128648048896==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I've added in the obviously missing cpu_to_le16().
--===============5873994128648048896==--

