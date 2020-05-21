Content-Type: multipart/mixed; boundary="===============2542577049475758475=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: kbuild-all@lists.01.org
Subject: Re: [linux-nvme:nvme-5.8 26/33] drivers/nvme/target/io-cmd-bdev.c:56: undefined reference to `t10_pi_type1_crc'
Date: Thu, 21 May 2020 10:27:38 +0200
Message-ID: <20200521082738.GB7587@lst.de>
In-Reply-To: <202005210855.RUq1UaNv%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2542577049475758475==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I've switched the IS_ENABLED(CONFIG_BLK_DEV_INTEGRITY) to the correct
CONFIG_BLK_DEV_INTEGRITY_T10 instead.
--===============2542577049475758475==--

