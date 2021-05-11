Content-Type: multipart/mixed; boundary="===============0221365614383656460=="
MIME-Version: 1.0
From: Mark Brown <broonie@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [broonie-misc:asoc-5.14 5/23] sound/soc/qcom/qdsp6/q6afe.c:1213:18: warning: variable 'port_id' is uninitialized when used here
Date: Tue, 11 May 2021 19:32:32 +0100
Message-ID: <20210511183232.GP4496@sirena.org.uk>
In-Reply-To: <ae8f5ec6-889b-8b42-fc05-96021af5918d@kernel.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0221365614383656460==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 11, 2021 at 11:23:27AM -0700, Nathan Chancellor wrote:

> Having both commits in the tree causes port_id to be uninitialized. If it=
 is
> too late, I can send a revert.

If it's in my tree then the patch has already been applied and a revert
is needed.

--===============0221365614383656460==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUFCQ2dBZEZpRUVyZVpvcW1kWEdM
V2Y0cC9xSk5hTGNsMVVoOUFGQW1DYXpjQUFDZ2tRSk5hTGNsMVUKaDlCS1NnZi9TWVlacVA3cWo3
UmhmMklJUVhsaDg5QzFkdDMveGN0cW9SMjFFTno1d1Zta1UyWVZMR1VGS1RuSwpOaUQ0Q2FNL004
MkVkeEEzSk5JbE5nNUZ6K1ZmRXBXLzdNR2tIWHVvQWVYOHhIMCszQnk1MVNYenJGRExvL1lyCngv
VkxRVFVkZ3hwUTJNSjVzdTl0R0RYV242WHRFT2xWQ2JRRzVVUGs4TnBZOFVLN3QyZGNTVzdGbU5U
R1B2akcKUXdpb1R2U3NMR3FrRk4vUXRlYjQwKzBNbkIybE1jK0t0TENnSmlYUUwzbUhPb1VXeFRD
Q0xXNnFVU04wWXI2NApaWFlBeFVJV2x6ZU9pOFd2cUZBck9PY2Z0THl3Z3pZdFpHcm5TUzJiREs4
UHBIQlczSUdGbnJJWlhiN3haVEdFCkI4WmRoY3ExYU8yNS9hZk1QOXhLbzdISWV4U3owQT09Cj1V
L1A5Ci0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============0221365614383656460==--

